class UserController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post "/signup" do
        user = User.new(name: params["name"], email: params["email"], password: params["password"])
        if user.name.blank? || user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
            redirect '/signup' 
        else
            user.save
            session[:user_id] = user.id 
            redirect "/notes" 
        end
    end

    get '/login' do 
        erb :"users/login"
    end

    post '/login' do 
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/notes'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end