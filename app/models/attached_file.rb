# frozen_string_literal: true

class AttachedFile < ApplicationRecord
  has_many :post_attached_files
  has_many :posts, through: :post_attached_files, dependent: :destroy

  validates :origin_url, presence: { case_sensitive: false }, uniqueness: true
end
