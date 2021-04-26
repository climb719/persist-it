require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    set :show_exceptions, false
    #default setting show what the exeption is and what is happening to help developer, turn to false so error message works 
    #store in session who is logged in and a cookie on client side to store session and 
    #every request verify that their cookie matches session 
    #secret to make sure your server hasn't been tampered with #so can keep safe with .env file
    #session is a hash that can store information in so we can add information to it
  end

  not_found do 
    #different from a record not found, this is for if a rote is not found
    status 404
    erb :"users/error"
  end
    
  get "/" do
    erb :welcome
  end
  
  error ActiveRecord::RecordNotFound do
    erb :"users/error"
  end
  #rescue for roecord not found telling routes when this is what to do with error not display error page, so redirect 

  helpers do #allows views to access these method, from view can accesss any methods in helpers so 
    #especially for accessing our view  and available in any controller 
    def logged_in?
      !!current_user
    end
     # singnify will return true or false
      #double bang turning into true or false value - asking is there a current user
    
  
    def current_user   
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # if @current_user return @current_user else set = User.find(session[:user_id)
      # ||=  insure will only does db look up ones time, because might mention @current_user multiple times in one request
      # and add if session[user_id] so if someone hasn't loggged doesn't even try
      end
    end

end
