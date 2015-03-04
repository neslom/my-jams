class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :songs

  has_secure_password
end
