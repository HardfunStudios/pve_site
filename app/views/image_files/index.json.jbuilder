# frozen_string_literal: true

json.array! @image_files, partial: 'image_files/image_file', as: :image_file
