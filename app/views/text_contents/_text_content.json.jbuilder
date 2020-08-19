json.extract! text_content, :id, :content, :post_id, :created_at, :updated_at
json.url text_content_url(text_content, format: :json)
