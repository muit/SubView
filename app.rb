require "sinatra"
require "sinatra/reloader" if development?

require 'date'

require_relative "lib/main.rb"


set :port, 3000
set :bind, '0.0.0.0'

