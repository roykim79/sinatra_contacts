require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the contact path', :type => :feature do
  before :each do
    visit '/'
  end

  it 'displays an empty list of contacts and a form' do
    expect(page).to have_css('ul.contacts', :count => 1)
    expect(page).not_to have_css('li.contact')
    expect(page).to have_css('form', :count => 1)
  end

  it 'displays the contact in the list of contacts after submitting the form' do
    fill_in :first_name, :with => 'John'
    fill_in :last_name, :with => 'Doe'
    fill_in :job_title, :with => 'Manager'
    fill_in :company, :with => 'ACME Inc'
    fill_in :contact_type, :with => 'Business'
    click_button 'Add'
    expect(page).to have_css('li.contact', :text => 'John')
    expect(page).to have_css('li.contact', :text => 'Doe')
  end

  it 'displays the contacts in the list of contacts that have been saved' do
    fill_in :first_name, :with => 'John'
    fill_in :last_name, :with => 'Doe'
    fill_in :job_title, :with => 'Manager'
    fill_in :company, :with => 'ACME Inc'
    fill_in :contact_type, :with => 'Business'
    click_button 'Add'
    fill_in :first_name, :with => 'Mike'
    fill_in :last_name, :with => 'Smith'
    fill_in :job_title, :with => 'Manager'
    fill_in :company, :with => 'ACME Inc'
    fill_in :contact_type, :with => 'Business'
    click_button 'Add'
    expect(page).to have_css('li.contact', :text => 'John')
    expect(page).to have_css('li.contact', :text => 'Doe')
    expect(page).to have_css('li.contact', :text => 'Mike')
    expect(page).to have_css('li.contact', :text => 'Smith')
  end

  it 'will show a detailed view of a contact when it is clicked on' do
    fill_in :first_name, :with => 'John'
    fill_in :last_name, :with => 'Doe'
    fill_in :job_title, :with => 'Manager'
    fill_in :company, :with => 'ACME Inc'
    fill_in :contact_type, :with => 'Business'
    click_button 'Add'
    click_link 'John Doe'
    expect(page).to have_content('Job Title')
  end
end
