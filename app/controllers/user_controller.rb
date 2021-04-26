class UserController < ApplicationController

    #user can sign up/ take user to form to sign up
    get '/signup' do
        erb :"users/new"
    end

    post "/signup" do
        #instantiate a user and make sure they signed up with valid data
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
            redirect "/notes" 
            #redirect them to where you want them to go first upon login 
        end
    end

    get '/login' do #get form to login 
        erb :"users/login"
    end

    post '/login' do #process login 
        #check if user with that email adress and check is password is correct
        user = User.find_by_email(params[:email])
        #use active record method related to has_secure_password, whcih allows to see if pw is correct
        #instance method to accept password as an argument - and return object if correct or false if not
        #if User.find does not find a user, user would be nil and can't call .authenticate on nil class
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/notes'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        #deletes session so logs them out, vs logging in which creates a session
        redirect '/'
    end
end