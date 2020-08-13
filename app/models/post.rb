class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, :through => :post_categories, :dependent => :destroy
  accepts_nested_attributes_for :post_categories, :allow_destroy => true
  has_many :post_tags
  has_many :tags, :through => :post_tags, :dependent => :destroy
  accepts_nested_attributes_for :post_tags, :allow_destroy => true
  validates :post_title, :post_content, presence: true
  
  def self.create_from_hook(params)
    puts "=================================="
    puts params.to_json
  end
  
  def self.update_from_hook(params)
    puts params.to_json
  end
end
