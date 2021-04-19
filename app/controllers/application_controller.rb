require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    #store in session who is logged in and a cookie on client side to store session and 
    #every request verify that their cookie matches session 
    #secret to make sure your server hasn't been tampered with #so can keep safe with .env file
    #session is a hash that can store information in so we can add information to it
  end

  get "/" do
    erb :welcome
  end

end
