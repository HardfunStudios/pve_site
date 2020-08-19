class PostImageFile < ApplicationRecord
  belongs_to :post
  belongs_to :image_file
end
