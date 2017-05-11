require 'rails_helper'

RSpec.feature "Gallery Admin", %q{
	some thing here :} do

#logs in user before each scenario
before(:each) do

	visit '/'
	 click_on "Log in"
	 fill_in 'Email', with: 'jacksmithtester@mdlive.com'
	 fill_in 'Password', with: 'mdlive123'
	 click_button('Log in')
	
end

scenario "add a gallery item" do

 	visit new_mediafile_path
 	expect(page).to have_content("New Media File")
			fill_in "mediafile_altText", with: "My alt text here"
			fill_in "mediafile_description", with: "my description here"
			fill_in "img URL", with: "http://st.motortrend.com/uploads/sites/5/2017/01/2017-Land-Rover-Range-Rover-SVAutobiography-Dynamic-front-three-quarter-in-motion-03-2.jpg"
			fill_in "Category", with: "vehicles"

			#click_button("Create Mediafile")
			#expect(page).to have_content("Media File Content below")
			expect{
      click_button 'Create Mediafile'
    }.to change(Mediafile, :count).by(1)
end

scenario "edit a gallery item" do
 
 visit "/mediafiles"
 click_on ("Edit")
#visit "/mediafiles/3/edit"


#			fill_in "Alt Text", with: "My edited alt text here"
#			fill_in "Description", with: "my edited description here"
			#fill_in "img URL", with: "http://st.motortrend.com/uploads/sites/10/2015/09/2016-Ferrari-488-Spider-front-three-quarter.jpg"
			#fill_in "Category", with: "vehicles"
#			click_button('Update Mediafile')
#			expect(page).to have_content("my edited description here")
end

end