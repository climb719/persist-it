class Topic < ActiveRecord::Base
    has_many :notes 
    has_many :users, through: :notes
end

