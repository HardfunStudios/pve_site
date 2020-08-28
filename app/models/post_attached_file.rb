# frozen_string_literal: true

class PostAttachedFile < ApplicationRecord
  belongs_to :post
  belongs_to :attached_file
end
