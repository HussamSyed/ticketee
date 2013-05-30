require 'spec_helper'

feature "Viewing projects" do 
	scenario "Listing all projects" do 
		project = Factory.create(:project, :name => "Sublime Text 2")
		visit '/'
		click_link 'Sublime Text 2'
		page.current_url.should == project_url(project)
	end
end