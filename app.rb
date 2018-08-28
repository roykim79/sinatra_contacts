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

post '/' do
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
