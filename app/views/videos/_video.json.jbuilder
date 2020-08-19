json.extract! video, :id, :url, :post_id, :created_at, :updated_at
json.url video_url(video, format: :json)
