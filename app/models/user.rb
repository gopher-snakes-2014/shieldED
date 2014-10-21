class User < ActiveRecord::Base
  validates :username, uniqueness: true
  has_many :events
  has_secure_password
  # def self.valid_login?
  #   if self.id != nil && self.password_hash == params[:password_hash]
  #   true
  # else
  #   false
  # end

end

