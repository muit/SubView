require 'rubygems'
require 'active_record'
require 'yaml'


def start(port, debug)
  require_relative "routeManager.rb"

  dbconfig = YAML::load(File.open('config/database.yml'))
  if !dbconfig
    throw new Error "Couldn´t load database settings. config/database.yml must be created."
  end

  ActiveRecord::Base.establish_connection(dbconfig)

  if debug
    require 'logger'
    ActiveRecord::Base.logger = Logger.new(STDERR)
  end

  set :port, port
  set :bind, '0.0.0.0'
end
