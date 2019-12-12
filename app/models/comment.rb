class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attr| attr[:username].blank? }

  # def user_attributes=(user_attributes)
  #   self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
  # end

end

# Need the reader from accepts_nested... but needed to redo the writer
# # to include the rejection. Might be a way to use reject_if...?

# Found a way to do it with reject_if!! See above, and dead code below it.
