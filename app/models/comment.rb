class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :user

  def user_attributes=(user_attributes_hash)
      self.user = User.find_or_create_by(username: user_attributes_hash[:username])  unless user_attributes_hash[:username].blank?
  end
end