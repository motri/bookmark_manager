#it understands user login information
require 'bcrypt'

class User
  include DataMapper::Resource
  # include BCrypt

  property :id, Serial
  property  :user, String
  property :password, String

end
