class ImageFile < ApplicationRecord
  has_many :post_image_files
  has_many :posts, :through => :post_image_files, :dependent => :destroy
  
  validates :origin_url, presence: true, uniqueness: true
  
  after_save :local_save
  
  def local_save
    DownloadWorker.perform_async(id, origin_url)
  end
end
