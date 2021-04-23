class Topic < ActiveRecord::Base
    has_many :notes
    has_many :users, through: :notes
end

#gives us instance merhods
#.notes
#.notes << (note_objects) Note.create(titel: " " )
#.notes.build(pass in notes attributes that's associated with )