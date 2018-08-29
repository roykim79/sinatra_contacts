require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/contact'
require 'pry'

get '/' do
  Contact.clear()
  @contacts = Contact.all()
  erb(:contacts)
end

get '/contacts' do
  @contacts = Contact.all()
  erb(:contacts)
end

post '/contacts' do
  contact = Contact.new({
    :first_name => params.fetch('first_name'),
    :last_name => params.fetch('last_name'),
    :job_title => params.fetch('job_title'),
    :company => params.fetch('company'),
    :contact_type => params.fetch('contact_type')
    })
  contact.save()
  @contacts = Contact.all()
  erb(:contacts)
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  erb(:contact_detail)
end

post '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  @contact.first_name = params.fetch('first_name')
  @contact.last_name = params.fetch('last_name')
  @contact.job_title = params.fetch('job_title')
  @contact.company = params.fetch('company')
  @contact.contact_type = params.fetch('contact_type')
  @contact.address = params.fetch('address')
  @contact.city = params.fetch('city')
  @contact.state = params.fetch('state')
  @contact.zipcode = params.fetch('zipcode')
  erb(:contact_detail)
end
