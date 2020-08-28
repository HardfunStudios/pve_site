# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :post_videos
  has_many :posts, through: :post_videos, dependent: :destroy

  validates :url, presence: true, uniqueness: true
end
