class UserController < ApplicationController

    #user can sign up/ take user to form to sign up
    get '/signup' do
        erb :"users/new"
    end

    post "/signup" do
        binding.pry
        instantiate a user and make sure they signed up with valid data
        user = User.new(name: params["name"], email: params["email"], password: params["password"])
        if user.name.blank? || user.password.blank? || User.find_by_email(params["email"])
            redirect '/signup' #redirect if invalid login attempt 
        else
            user.save
            #if valid signup log them in/start a session
            session[:user_id] = user.id #store their user id in the session and set it equal to the user_id, addkey value pairs to session 
            #because session is a hash, can add info to it
            #need to keep track on server side who is logged in and every request verifying our logged in user
            #sessions and cookies - where site asks cookies - storing data in your client side application so can verify user or keep track of what you clicked on 
            #sessions keeps track on server side  
            redirect '/notes'
            #redirect them to where you want them to go first upon login 
        end
    end

    get '/login' do
        erb :"users/login"
    end

    

end