class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :post_categories
  has_many :posts, :through => :post_categories, :dependent => :destroy

  validates :name, uniqueness: true, presence: true
end
