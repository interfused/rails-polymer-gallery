require 'rails_helper'

RSpec.describe "Add User", %q{
	Attempt to add user :} do

		before(:each) do
			visit new_user_path
		end

		it "successfully create user account", js:true do

			fill_in "user_first_name", with: "Jane"
			fill_in "user_last_name", with: "Smith"
			fill_in "user_email", with: "janesmithtester@mdlive.com"
			fill_in "user_password", with: "mdlive123"
			fill_in "user_password_confirmation", with: "mdlive123"

			click_button("Create my account")
			expect(page).to have_content("Welcome to the Gallery App")
			#			expect{
 			#     click_button 'Create my account'
			#    }.to change(User, :count).by(1)
		end

		it "user already exists", js:true do
			fill_in "user_first_name", with: "Jack"
			fill_in "user_last_name", with: "Smith"
			fill_in "user_email", with: "jacksmithtester@mdlive.com"
			fill_in "user_password", with: "mdlive123"
			fill_in "user_password_confirmation", with: "mdlive123"

			click_button("Create my account")
			expect(page).to have_content("Email has already been taken")
		end

		it "user did not fill out required fields" do
			click_button("Create my account")
			expect(page).to have_content("First name can't be blank")
		end
	end