require "spec_helper"

feature 'Deleting projects' do

  before do
    @textmate_2 = Factory(:project, :name => 'TextMate 2')
  end

  scenario "Deleting a project" do
    visit '/'
    click_link 'TextMate 2'
    click_link 'Delete Project'
    page.should have_content('Project has been deleted.')

    visit '/'
    page.should_not have_content('TextMate 2')
  end

  scenario 'Deleting a project with tickets also deletes the tickets' do
    ticket = Factory(:ticket,
                     :project => @textmate_2,
                     :title => 'Make it shiny!',
                     :description => 'Gradients! Starbursts! Oh my!')
    visit '/'
    click_link 'TextMate 2'
    click_link 'Delete Project'

    expect{ Ticket.find(ticket) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end