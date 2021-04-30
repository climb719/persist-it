class NoteController < ApplicationController
   
    get '/notes' do 
        redirect_if_not_logged_in
        @notes = current_user.topics.group(:name)
        erb :"notes/index"
    end

    get '/notes/new' do 
        redirect_if_not_logged_in
        erb :"notes/new"
    end

    get '/notes/:id' do 
        redirect_if_not_logged_in
        @note = Note.find(params["id"])
        erb :"notes/show"
    end

    post '/notes' do
        redirect_if_not_logged_in 
        note = Note.new(params)
        note.user_id = session[:user_id] 
        note.save
        redirect '/notes'
    end

    get '/notes/:id/edit' do 
        @note = Note.find(params["id"]) 
        redirect_unauthorized_user
        erb :"notes/edit"
    end

    patch '/notes/:id' do 
        @note = Note.find(params["id"])
        redirect_unauthorized_user
        @note.update(params["note"])
        redirect "/notes/#{@note.id}"
    end

    delete '/notes/:id' do
       @note =  Note.find(params["id"]) 
       redirect_unauthorized_user
       @note.destroy
       redirect '/notes'
    end

    private 

    def redirect_unauthorized_user  
        if @note.user != current_user 
            redirect '/notes' 
        end 
    end

    def redirect_if_not_logged_in
        if !logged_in?
          redirect '/login'
        end
    end
end