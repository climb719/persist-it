class Note  < ActiveRecord::Base
    belongs_to :user
end

#reader and writer methods - looks at table and gives reader/writer for attributes listed in table 