class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

 
    # comments
    # needs iterate over the category value
    # need to check does that category has a key of name that is empty
    # if key of name is not empty then say find or create a category based on that name 
    #   and then add that category to self.category

    def categories_attributes=(category_attributes)
      category_attributes.values.each do |category_attribute|
        if category_attribute["name"].present?
          category = Category.find_or_create_by(category_attribute)
          self.categories << category
        end
      end
    end
end
