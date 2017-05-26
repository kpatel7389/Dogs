require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :images

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  validate :password_entered

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(username, password)
   self.password == password && self.username == username
 end

 def password_entered
   if @raw_password.empty?
     @errors.add(:password, "can't be left blank")
   end
 end

end
