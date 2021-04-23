class User < ActiveRecord::Base #get methods from AR including method to set up relationship
    has_many :notes #macro that gives many methods call user.notes or user.notes=, etc.
    has_many :topics, through: :notes #will be similar to has_many 
    #notes is connecting factor"
    has_secure_password #AR method for converting password, method called on class
    #knows it will turn passowrd into password_digest and needs the gem bcrypt
    #provides a reader and writer for password
    #provides authenticat method
end