class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, :through => :post_categories, :dependent => :destroy
  accepts_nested_attributes_for :post_categories, :allow_destroy => true
  has_many :post_tags
  has_many :tags, :through => :post_tags, :dependent => :destroy
  accepts_nested_attributes_for :post_tags, :allow_destroy => true
  has_many :post_videos
  has_many :videos, :through => :post_videos, :dependent => :destroy
  accepts_nested_attributes_for :post_videos, :allow_destroy => true
  has_many :post_image_files
  has_many :image_files, :through => :post_image_files, :dependent => :destroy
  accepts_nested_attributes_for :post_image_files, :allow_destroy => true
  has_many :post_attached_files
  has_many :attached_files, :through => :post_attached_files, :dependent => :destroy
  accepts_nested_attributes_for :post_attached_files, :allow_destroy => true
  has_many :text_contents
  
  validates :post_title, :post_content, presence: true
  
  after_save :parse_content
  
  def self.create_from_hook(params)
    json_post = JSON.parse(params.to_json)
  
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

      Category.create_from_hook(json_post.dig('taxonomies', 'category'), post) unless json_post.dig('taxonomies', 'category').nil?
      Tag.create_from_hook(json_post.dig('taxonomies', 'post_tag'), post) unless json_post.dig('taxonomies', 'post_tag').nil?
      
      post
    else
      raise ActiveRecord::RecordNotSaved.new "STOP Wordpress post creation" +
        "Wordpress post can not be saved"
    end
  end
  

  def self.update_from_hook(params, existing_post)
    puts params.to_json

    json_post = JSON.parse(params.to_json)

    existing_post.post_modified = json_post.dig('post', 'post_modified')
    existing_post.post_modified_gmt = json_post.dig('post', 'post_modified_gmt')
    existing_post.comment_count = json_post.dig('post', 'comment_count')
    
    existing_post.comment_status = json_post.dig('post', 'comment_status')
    existing_post.ping_status = json_post.dig('post', 'ping_status')
    existing_post.post_nama = json_post.dig('post', 'post_name')
    existing_post.post_content = json_post.dig('post', 'post_content')

    existing_post.post_title = json_post.dig('post', 'post_title')
    existing_post.post_status = json_post.dig('post', 'post_status')
    existing_post.post_excerpt = json_post.dig('post', 'post_excerpt')

    if existing_post.save

      Category.create_from_hook(json_post.dig('taxonomies', 'category'), existing_post) unless json_post.dig('taxonomies', 'category').nil?
      Tag.create_from_hook(json_post.dig('taxonomies', 'post_tag'), existing_post) unless json_post.dig('taxonomies', 'post_tag').nil?

      existing_post
    else
      raise ActiveRecord::RecordNotSaved.new "STOP Wordpress post update" +
        "Wordpress post can not be updated"
    end
  end
  
  def parse_content
    parsed_data = Nokogiri::HTML.parse(post_content)
    
    # videos
    videos.destroy_all
    content = parsed_data.css('.wp-block-embed-youtube div')
    unless content.empty?
      content.each do |video|
        videos << Video.find_or_create_by(url: video.text.squish)
      end
    end
    
    # texts
    text_contents.destroy_all
    content = parsed_data.css('p')
    unless content.empty?
      content.each do |txt|
        text_contents << TextContent.create(content: txt.text.squish) unless txt.text.blank?
      end
    end
    
    # images
    image_files.destroy_all
    content = parsed_data.xpath('//img')
    unless content.empty?
      content.each do |img|
        image_files << ImageFile.find_or_create_by(origin_url: img[:src])
      end
    end
    
    # files
    attached_files.destroy_all
    content = parsed_data.css('.wp-block-file a')
    unless content.empty?
      content.each do |file|
        attached_files << AttachedFile.find_or_create_by(origin_url: file[:href])
      end
    end
  end
end
