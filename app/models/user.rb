class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :pics, through: :posts
  has_many :posts
end
