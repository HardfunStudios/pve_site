class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :post_categories
  has_many :posts, :through => :post_categories, :dependent => :destroy
  accepts_nested_attributes_for :post_categories, :allow_destroy => true
  validates :name, uniqueness: true, presence: true
end
