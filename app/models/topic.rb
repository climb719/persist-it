class Topic < ActiveRecord::Base
    has_many :notes #class method - know it's called on class because it is being called on self implicitly
    # and self outside of instance method is always the class :notes being passed in lik an argument
    has_many :users, through: :notes
end

#gives instance merhods
#.notes
#.notes << (note_objects) Note.create(titel: " " )
#.notes.build(pass in notes attributes that's associated with )