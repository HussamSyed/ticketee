require 'spec_helper'

feature 'Creating Projects' do
	scenario "can create a project" do
		visit '/'
		click_link 'New Project'
		fill_in 'Name', :with => 'Sublime Text 2'
		fill_in 'Description', :with => "A text-editor for Ubuntu"
		click_button 'Create Project'
		page.should have_content('Project has been created.')
		
		project = Project.find_by_name("Sublime Text 2")
		page.current_url.should == project_url(project)
		title = "Sublime Text 2 - Projects - Ticketee"
		find("title").should have_content(title)

	end

	
end


