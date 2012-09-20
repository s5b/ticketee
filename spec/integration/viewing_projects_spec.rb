require 'spec_helper'

feature 'Viewing projects' do

  let(:expected_project_name) { 'TextMate 2'}

  scenario 'Listing all projects' do
    project = Factory.create(:project, :name => expected_project_name)
    visit '/'
    click_link expected_project_name
    page.current_url.should == project_url(project)
  end

end