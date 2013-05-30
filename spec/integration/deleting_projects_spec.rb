require 'spec_helper'

feature "Deleting projects" do 
	scenario "Deleting a project" do 
		Factory(:project, :name => "Sublime Text 2")
		visit "/"
		click_link "Sublime Text 2"
		click_link "Delete Project"
		page.should have_content("Project has been deleted.")

		visit "/"
		page.should_not have_content("Sublime Text 2")
	end
end