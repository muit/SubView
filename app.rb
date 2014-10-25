require "sinatra"
require "sinatra/reloader" if development?

require 'date'

require_relative "lib/main.rb"

start 3000, true
