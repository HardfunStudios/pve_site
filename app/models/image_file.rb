class ImageFile < ApplicationRecord
  has_many :post_image_files
  has_many :posts, :through => :post_image_files, :dependent => :destroy
  
  validates :origin_url, presence: true, uniqueness: true
end
