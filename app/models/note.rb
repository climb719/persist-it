class Note < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
end

#reader and writer methods - looks at table and gives reader/writer for attributes listed in table 
#methods
#.topic
#.topic=(accept a topic object as an argument )
#.build_topic(accept a topic attribute hash)