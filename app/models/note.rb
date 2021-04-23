class Note < ActiveRecord::Base
    belongs_to :user
    belongs_to :topic
end
  #join table b/c it has 2 foreign keys or 2 belongs_to relationships
    
    #methods we get as a result of belongs_to:
#reader and writer methods - looks at table and gives reader/writer for attributes listed in table 
#methods
#.topic
#.topic=(accept a topic object as an argument )
#.build_topic(accept a topic attribute hash)