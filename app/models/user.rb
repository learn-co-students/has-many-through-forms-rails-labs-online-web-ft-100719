class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  validates :username, presence: true, uniqueness: true, length: {minimum:3}
end
