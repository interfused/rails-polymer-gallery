require 'rails_helper'

RSpec.feature "User Management", %q{some thing here} do

#http://larsgebhardt.de/user-authentication-with-ruby-on-rails-rspec-and-capybara/
    background do
      @user = create(:user)
    end

    scenario "allow a user to create account" do
		visit new_user_path
			fill_in "user_first_name", with: "Jack"
			fill_in "user_last_name", with: "Smith"
			fill_in "user_email", with: "jacksmithtester@mdlive.com"
			fill_in "user_password", with: "mdlive123"
			fill_in "user_password_confirmation", with: "mdlive123"

			#click_button("Create my account")
			#expect(page).to have_content("Welcome to the Gallery App")
			expect{
      click_button 'Create my account'
    }.to change(User, :count).by(1)
	end

	
end