class NoteController < ApplicationController
    #seperation of concerns, inherit from App controller - specified in config.ru
    #inherit from AC use in conjuction with main controller we are going to run
    #inherits so can use same info from configure do block and inherit from Sinatra Base and access any helper methods 
    get '/notes' do
        erb :"notes/index"
    end

    get '/notes/new' do
        if !logged_in?
            redirect '/login' #acts likea return, will leave method and won't get to rb or if logged in will skip redirect and go to erb
        end
            erb :"notes/new"
    end


    post '/notes' do
        if !logged_in?
            redirect '/login' #acts likea return, will leave method and won't get to rb or if logged in will skip redirect and go to erb
        end #important user can't access if not logged in - protects routest, especailly routes where hit database/add to db
        note = Note.new(params) 
        #need to associate the note to the user, to associate with current user
        note.user_id = session[:user_id] 
         #have writer methods from belogs_to and set to the current user who is logged in through the session
        note.save
        redirect '/notes'
    end


end