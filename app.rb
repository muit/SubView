require "sinatra"
require "sinatra/reloader" if development?

require 'date'
set :port, 3000
set :bind, '0.0.0.0'

get "/" do
  "helloworld"
end

get "/date" do
  erb :date
end

post "/form" do
  "You sent #{params}"
end

get "/sendform" do
  erb :form
end