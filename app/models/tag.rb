# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :parent, class_name: 'Tag', optional: true
  has_many :post_tags
  has_many :posts, through: :post_tags, dependent: :destroy

  def self.create_from_hook(params, post)
    post.tags.destroy_all

    params&.each do |param|
      existing_tag = Tag.where(name: param[1].dig('name'))

      if existing_tag.empty?
        @tag = Tag.new

        @tag.term_wp_id = param[1].dig('term_id')
        @tag.name = param[1].dig('name')
        @tag.slug = param[1].dig('slug')
        @tag.term_group = param[1].dig('term_group')
        @tag.term_taxonomy_id = param[1].dig('term_taxonomy_id')
        @tag.description = param[1].dig('description')
        @tag.parent_wp_id = param[1].dig('parent')
        @tag.count = param[1].dig('count')
        @tag.filter = param[1].dig('filter')
        @tag.taxonomy = param[1].dig('taxonomy')

        if @tag.save
          post.tags << @tag
          @tag
        else
          raise ActiveRecord::RecordNotSaved, 'STOP Wordpress tag creation' +
                                              'Wordpress tag can not be saved'
        end
      else
        puts 'Updating...'
        update_from_hook(param, existing_tag.first, post)
      end
    end
  end

  def self.update_from_hook(param, existing_tag, post)
    existing_tag.description = param[1].dig('description')
    existing_tag.count = param[1].dig('count')

    if existing_tag.save
      post.tags << existing_tag
      existing_tag
    else
      raise ActiveRecord::RecordNotSaved, 'STOP Wordpress tag update' +
                                          'Wordpress tag can not be updated'
    end
  end
end
