class NoteController < ApplicationController
    #seperation of concerns, inherit from App controller - specified in config.ru
    #inherit from AC use in conjuction with main controller we are going to run
    #inherits so can use same info from configure do block and inherit from Sinatra Base and access any helper methods 
    get '/notes' do #READ get all notes
       # binding.pry
        @notes = current_user.notes
        @topics = current_user.topics.group(:name)
        #binding.pry
        #current_user.notes.order(:topic)
        #accessing model from controller
        #passing to view so can render for user
        erb :"notes/index"
    end

    get '/notes/new' do #get form to CREATE a note
        redirect_if_not_logged_in
       
        #acts like a return, will leave method and won't get to erb or if logged in will skip redirect and go to erb
        erb :"notes/new"
    end

    get '/notes/:id' do #READ  get one note
        redirect_if_not_logged_in
        @note = Note.find(params["id"])
        erb :"notes/show"
    end

    post '/notes' do
        
        #CREATES a new note
        redirect_if_not_logged_in #acts likea return, will leave method and won't get to rb or if logged in will skip redirect and go to erb
         #important user can't access if not logged in - protects routest, especailly routes where hit database/add to db
        note = Note.new(params)
        #need to associate the note to the user, to associate with current user
        note.user_id = session[:user_id] 
         #have writer methods from belogs_to and set to the current user who is logged in through the session
        note.save
        redirect '/notes'
    end

    get '/notes/:id/edit' do #view a form to update/edit 1 note
        @note = Note.find(params["id"]) #first find note 
        redirect_unauthorized_user
        # this will display the edit view 
        #id is way to specify what note the user want to see, it's a particular note
        #don't know what id is with note untill saved to db
        erb :"notes/edit"
    end

    put '/notes/:id' do #update 1 note and db based on the edit form
        @note = Note.find(params["id"]) #id a param -key - comes from route or form. key value pair
        redirect_unauthorized_user
        #binding.pry #to access something in a hash use hash beraket notation, need to first find the specif note
        #when any individual note is need, first need to find the note (returns whole note object)
        #then need to display it in a view 
        @note.update(params["note"])
        redirect "/notes/#{@note.id}"
    end

    delete '/notes/:id' do
       @note =  Note.find(params["id"]) #afrer trying to find movie then @movie would be nil and could not run check
       redirect_unauthorized_user
       @note.destroy
       redirect '/notes'
    end

    private 
    def redirect_if_not_logged_in
        if !logged_in?
          redirect '/login'
        end
    end

    def redirect_unauthorized_user  #private only use internally in other instance methods 
        if @note.user != current_user #can all share access to instance variable/this method
            redirect '/notes'  # where to redirect if not logged in??
        end 
    end

end