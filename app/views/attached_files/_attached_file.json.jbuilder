# frozen_string_literal: true

json.extract! attached_file, :id, :origin_url, :local_url, :file_type, :created_at, :updated_at
json.url attached_file_url(attached_file, format: :json)
