require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new project', {:type => :feature}) do
  it('allows user to enter a project name and show onto project list') do
    visit('/')
    fill_in('title', :with => 'Project Name')
    click_button('Add project')
    expect(page).to have_content ('Project Name')
  end
end
