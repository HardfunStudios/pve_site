class Tag < ApplicationRecord
  belongs_to :parent, class_name: 'Tag', optional: true
  has_many :post_tags
  has_many :posts, :through => :post_tags, :dependent => :destroy
end
