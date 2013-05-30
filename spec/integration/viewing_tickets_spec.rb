require 'spec_helper'

feature "Viewing tickets" do 
	before do
		sublime_text_2 = Factory(:project, :name => "Sublime Text 2")
		Factory(:ticket,
				:project => sublime_text_2,
				:title => "Make it shiny!",
				:description => "Gradients! Starbursts! Oh my!")

		google_chrome = Factory(:project, :name => "Google Chrome")

		Factory(:ticket,
				:project => google_chrome,
				:title => "Standards compliance",
				:description => "Isn't a joke.")

		visit '/'
	end 

	scenario "Viewing tickets for a given project" do 
		click_link "Sublime Text 2"
		page.should have_content("Make it shiny!")
		page.should_not have_content("Standards compliance")

		click_link "Make it shiny!"
		within("#ticket h2") do 
			page.should have_content("Make it shiny!")
		end
		page.should have_content("Gradients! Starbursts! Oh my!")
	end
end