# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories, dependent: :destroy
  accepts_nested_attributes_for :post_categories, allow_destroy: true
  has_many :post_tags
  has_many :tags, through: :post_tags, dependent: :destroy
  accepts_nested_attributes_for :post_tags, allow_destroy: true
  has_many :post_videos
  has_many :videos, through: :post_videos, dependent: :destroy
  accepts_nested_attributes_for :post_videos, allow_destroy: true
  has_many :post_image_files
  has_many :image_files, through: :post_image_files, dependent: :destroy
  accepts_nested_attributes_for :post_image_files, allow_destroy: true
  has_many :post_attached_files
  has_many :attached_files, through: :post_attached_files, dependent: :destroy
  accepts_nested_attributes_for :post_attached_files, allow_destroy: true
  has_many :text_contents, dependent: :destroy

  validates :post_title, :post_content, :wp_id, presence: true

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
    post.post_name = json_post.dig('post', 'post_name')

    post.post_modified = json_post.dig('post', 'post_modified')
    post.post_modified_gmt = json_post.dig('post', 'post_modified_gmt')
    post.post_content_filtered = json_post.dig('post', 'post_content_filtered')

    post.post_parent = json_post.dig('post', 'post_parent')
    post.wp_id = json_post.dig('post_id')
    post.menu_order = json_post.dig('post', 'menu_order')

    post.guid = json_post.dig('post', 'guid')
    post.post_type = json_post.dig('post', 'post_type')
    post.post_mime_type = json_post.dig('post', 'post_mime_type')

    post.comment_count = json_post.dig('post', 'comment_count')
    post.filter = json_post.dig('post', 'filter')
    post.post_meta = json_post.dig('post_meta')

    post.post_thumbnail = json_post.dig('post_thumbnail')

    if post.save
      unless json_post.dig('taxonomies', 'category').nil?
        Category.create_from_hook(json_post.dig('taxonomies', 'category'), post)
      end
      unless json_post.dig('taxonomies', 'post_tag').nil?
        Tag.create_from_hook(json_post.dig('taxonomies', 'post_tag'), post)
      end
      post
    else
      raise ActiveRecord::RecordNotSaved, 'Wordpress post can not be saved'
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
    existing_post.post_name = json_post.dig('post', 'post_name')
    existing_post.post_content = json_post.dig('post', 'post_content')

    existing_post.post_title = json_post.dig('post', 'post_title')
    existing_post.post_status = json_post.dig('post', 'post_status')
    existing_post.post_excerpt = json_post.dig('post', 'post_excerpt')
    existing_post.post_thumbnail = json_post.dig('post_thumbnail')

    if existing_post.save

      unless json_post.dig('taxonomies', 'category').nil?
        Category.create_from_hook(json_post.dig('taxonomies', 'category'), existing_post)
      end
      unless json_post.dig('taxonomies', 'post_tag').nil?
        Tag.create_from_hook(json_post.dig('taxonomies', 'post_tag'), existing_post)
      end

      existing_post
    else
      raise ActiveRecord::RecordNotSaved, 'Wordpress post can not be updated'
    end
  end

  def parse_content
    service_parser = PostContentParserService.new(self)
    service_parser.execute
  end
  
  def increase_view
    views = view_counter.nil? ? 0 : view_counter + 1
    update_column(:view_counter, views)
  end
  
  def category_number
    category_names = categories.map(&:name)
    cat_0 = ['Webinar PVE']
    cat_1 = ['Oportunidades Formativas', 'Oportunidades formativas']
    cat_2 = ['Notícias']
    cat_3 = ['Conteúdos', 'Conteúdos de apoio']
    cat_4 = ['Materiais', 'Materiais de mobilização', 'Materiais para baixar']
    if !(category_names & cat_0).empty?
      return '0'
    elsif !(category_names & cat_1).empty?
      return '1'
    elsif !(category_names & cat_2).empty? 
      return '2'
    elsif !(category_names & cat_3).empty? 
      return '3'
    elsif !(category_names & cat_4).empty? 
      return '4'
    end
  end
  
  def related_posts
    related = []
    tags&.each do |tag|
      related += tag.posts.where.not(id: id)
    end
    related.take(3)
  end
  
  def tag_names
    tags&.pluck(:name).join(', ')
  end
end
