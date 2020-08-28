# frozen_string_literal: true

class ImageFile < ApplicationRecord
  has_many :post_image_files
  has_many :posts, through: :post_image_files, dependent: :destroy

  validates :origin_url, presence: true, uniqueness: true

  after_save :local_save

  def local_save
    filename = id.to_s + File.extname(origin_url)
    DownloadWorker.perform_async(filename, origin_url)
    update_column(:local_url, 'posts/' + filename)
  end

  def img_url
    local_url || origin_url
  end
end
