ENV['SINATRA_ENV'] ||= "development"
#if else statement  environemnt ealready exists return this environment else set this environment = to development
#can chnage "devlopment" to "production" easily for example and use ENV  in many places 

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV']) #require all default gems and make sure to require gems for development 
require 'dotenv/load'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
) #active record code to create connection -takes in aregument of hash, what gem sqlight3 (which database we want to use) and where it is located) 

require './app/controllers/application_controller'
require_all 'app'
