class Post < ApplicationRecord
  
  def self.create_from_hook(params)
    json_post = JSON.parse(params.to_json)

    existing_post = Post.where(post_wp_id: json_post.dig('post_id'))

    if existing_post.empty?
      post = Post.new

      post.post_author = json_post.dig('post', 'post_author')
      post.post_date_gmt = json_post.dig('post', 'post_date_gmt')
      post.post_content = json_post.dig('post', 'post_content')

      post.post_title = json_post.dig('post', 'post_title')
      post.post_status = json_post.dig('post', 'post_status')
      post.post_excerpt = json_post.dig('post', 'post_excerpt')

      post.comment_status = json_post.dig('post', 'comment_status')
      post.ping_status = json_post.dig('post', 'ping_status')
      post.post_nama = json_post.dig('post', 'post_name')

      post.post_modified = json_post.dig('post', 'post_modified')
      post.post_modified_gmt = json_post.dig('post', 'post_modified_gmt')
      post.post_content_filtered = json_post.dig('post', 'post_content_filtered')

      post.post_parent = json_post.dig('post', 'post_parent')
      post.post_wp_id = json_post.dig('post_id')
      post.menu_order = json_post.dig('post', 'menu_order')

      post.guid = json_post.dig('post', 'guid')
      post.post_type = json_post.dig('post', 'post_type')
      post.post_mime_type = json_post.dig('post', 'post_mime_type')

      post.comment_count = json_post.dig('post', 'comment_count')
      post.filter = json_post.dig('post', 'filter')
      post.post_meta = json_post.dig('post_meta')

      post.post_thumbnail = json_post.dig('post_thumbnail')

      if post.save
        post
      else
        raise ActiveRecord::RecordNotSaved.new "STOP Wordpress post creation" +
          "Wordpress post can not be saved"
      end
    end
  end
  
  def self.update_from_hook(params)
    puts params.to_json
  end
end
