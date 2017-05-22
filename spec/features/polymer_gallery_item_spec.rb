require 'rails_helper'

RSpec.describe "Gallery Navigation", %q{
	Some simple polymer interaction :} do

		before(:each) do
			visit "/mediafiles"
		end

		it "checks gallery thumbnail image click", js:true do
			galleryElements = page.all("gallery-element")
			galleryElements.first.click
			expect(page).to have_content("description here")
			#expect(galleryElements.first).to have_content("My edited content here")
		end

		it "checks existance of thumbnail", js:true do
			
			galleryEl = page.first("gallery-element")
			
			within(galleryEl) do 
				tgtDiv = page.first(".img")
				#binding.pry
				#https://relishapp.com/rspec/rspec-expectations/v/3-6/docs/built-in-matchers/be-matchers#be-matcher
				expect(tgtDiv['style'] == 'background-image: url("http://st.motortrend.com/uploads/sites/5/2017/01/2017-Land-Rover-Range-Rover-SVAutobiography-Dynamic-front-three-quarter-in-motion-03-2.jpg");').to be true
			end 
		end

	end