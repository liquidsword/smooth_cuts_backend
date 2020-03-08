class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :user, presence: true
end
