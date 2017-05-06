# it understands user login information
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  attr_reader :password
  attr_accessor :password_confirmation
  property :id, Serial
  property :user, String
  property :hash_password, Text

  def password=(password)
    @password = password
    self.hash_password = BCrypt::Password.create(password)
  end
  validates_confirmation_of :password
end
