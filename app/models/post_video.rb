class PostVideo < ApplicationRecord
  belongs_to :post
  belongs_to :video
end
