require 'rails_helper'

RSpec.describe "Gallery Admin", %q{
	Some admin features below :} do


#logs in user before each it
before(:each) do
	#	Capybara.current_driver = :selenium
	visit '/'
	click_on "Log in"
	fill_in 'Email', with: 'jacksmithtester@mdlive.com'
	fill_in 'Password', with: 'mdlive123'
	click_button('Log in')

end

after(:each) do
	Capybara.use_default_driver
end

it "add a gallery item", js:true do

	visit new_mediafile_path
	expect(page).to have_content("Alt Text")
	fill_in "mediafile_altText", with: "My alt text here"
	fill_in "mediafile_description", with: "my description here"
	fill_in "img URL", with: "http://st.motortrend.com/uploads/sites/5/2017/01/2017-Land-Rover-Range-Rover-SVAutobiography-Dynamic-front-three-quarter-in-motion-03-2.jpg"
	fill_in "Category", with: "vehicles"

	click_button("Create Mediafile")
	expect(page).to have_content("http://st.motortrend.com/uploads/sites/5/2017/01/2017-Land-Rover-Range-Rover-SVAutobiography-Dynamic-front-three-quarter-in-motion-03-2.jpg")
	
end

it "edit a gallery item", js:true do

	visit "/mediafiles"
	editBtns = find_all(".btn-edit")
	#because of multiple items need to be able to find first element
	editBtns.first.click
	#build an array of elements with 
	expect(page).to have_field("Alt Text")
	fill_in "Alt Text", with: "My edited alt text here"
	fill_in "Description", with: "my edited description here"
	#fill_in "img URL", with: "http://st.motortrend.com/uploads/sites/10/2015/09/2016-Ferrari-488-Spider-front-three-quarter.jpg"
	#fill_in "Category", with: "vehicles"
	click_button('Update Mediafile')
	expect(page).to have_content("my edited description here")
end

it "deletes a gallery item", js: true do

	visit "/mediafiles"
		#because of multiple items need to be able to find first element
		deleteBtns = page.all(".btn-delete")
		elCnt = page.all("gallery-element")
		@size1 = elCnt.size
		#figure out javascript confirmations
		#http://stackoverflow.com/questions/2458632/how-to-test-a-confirm-dialog-with-cucumber/5002648#comment-8214000
		#page.evaluate_script('window.confirm = function() { return true; }')
		#binding.pry
		#expect{
		#page.click 'OK'
		#}.to change(Mediafile, :count).by(-1)
		deleteBtns.first.click
		#popup = window_opened_by do
		#	deleteBtns.first.click
		#end

		#within_window popup  do
		#	click_button 'OK'
		#end
		#http://stackoverflow.com/questions/6930927/how-do-i-confirm-a-javascript-popup-with-capybara
		a = page.driver.browser.switch_to.alert
	    #expect(a.text).to eq("Are you sure?")
	    a.accept

	    elCnt = page.all("gallery-element")
	    @size2 = elCnt.size
    	#binding.pry
    	expect(@size2 == (@size1-1) ).to be true    

    end	

end