require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set :show_exceptions, false

describe 'the contact path', :type => :feature do
  before :each do
    visit '/'
    fill_in :first_name, :with => 'John'
    fill_in :last_name, :with => 'Doe'
    fill_in :job_title, :with => 'Manager'
    fill_in :company, :with => 'ACME Inc'
    fill_in :contact_type, :with => 'Business'
  end

  it 'displays an empty list of contacts and a form' do
    expect(page).to have_css('ul.contacts', :count => 1)
    expect(page).not_to have_css('li.contact')
    expect(page).to have_css('form', :count => 1)
  end

  it 'displays the contact in the list of contacts after submitting the form' do
    click_button 'Add'
    expect(page).to have_css('li.contact', :text => 'John')
    expect(page).to have_css('li.contact', :text => 'Doe')
  end

  it 'displays the contacts in the list of contacts that have been saved' do
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
    click_button 'Add'
    click_link 'John Doe'
    expect(page).to have_content('Job Title')
  end

  it 'will have a link to get from the contact_detail to the main contacts view' do
    click_button 'Add'
    click_link 'John Doe'
    click_link 'Back to contacts'
    expect(page).to have_css('ul.contacts', :count => 1)
    expect(page).to have_css('form', :count => 1)
  end

  it 'will have a form where the user can add an address to a contact' do
    click_button 'Add'
    click_link 'John Doe'
    expect(page).to have_selector('form')
    expect(page).to have_css('input#address')
    expect(page).to have_css('input#first_name')
  end

  it 'will have a submit button on the contact_detail view where a user can submit changes' do
    click_button 'Add'
    click_link 'John Doe'
    expect(page).to have_selector('button')
  end

  it 'will save changes from contact_details view when the user saves changes' do
    click_button 'Add'
    click_link 'John Doe'
    fill_in :address, :with => '123 Main St'
    click_button 'Save changes'
    click_link 'Back to contacts'
    click_link 'John Doe'
    expect(page).to have_selector("input[value='123 Main St']")
  end
end
