# it understands user login information
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :user, String
  property :hash_password, Text

  def password=(password)
    self.hash_password = BCrypt::Password.create(password)
  end

  # def test_password(password, hash)
  #   BCrypt::Password.new(hash) == password
  # end
end
