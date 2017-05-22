require 'rails_helper'
##for some reason, test database is not populated with data from add_user_spec.rb test so had to manually create account for this test to pass
RSpec.describe "Login procedures", js:true do
	
	it "User is registered and has a successful login" do
		visit login_path
		#jacksmithtester@mdlive.com
			fill_in "Email", with: "jacksmithtester@mdlive.com"
			fill_in "Password", with: "mdlive123"
			
			click_button("Log in")
			#expect(page).to have_no_content("Welcome") #waits for the sign in page to disappear and open welcome page.
			#expect(page).to have_content("Hi John")
			expect(page).to have_content("WELCOME BACK")
			
			#expect(page).to have_current_path('/users')
	end

	it "User fails login", js:true do
		visit login_path
		#jacksmithtester@mdlive.com
			fill_in "Email", with: "jacksmithtester@mdlive.com"
			#fill_in "Password", with: "mdlive123"
			
			click_button("Log in")
			expect(page).to have_content("Invalid email/password combination")
	end

end