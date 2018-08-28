require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the contact path', :type => :feature do
  before :each do
    visit '/'
  end

  it 'display and empty list of contacts and a form' do
    expect(page).to have_css('ul.contacts', :count => 1)
    expect(page).not_to have_css('li.contact')
    expect(page).to have_css('form', :count => 1)
  end
end
