# frozen_string_literal: true

json.extract! image_file, :id, :origin_url, :local_url, :created_at, :updated_at
json.url image_file_url(image_file, format: :json)
