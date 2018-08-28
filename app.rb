require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/contact'
require 'pry'

get '/' do
  @contacts = Contact.all()
  erb(:contacts)
end
