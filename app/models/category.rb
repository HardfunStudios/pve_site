# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :post_categories
  has_many :posts, through: :post_categories, dependent: :destroy

  validates :name, uniqueness: { case_sensitive: false }, presence: true

  def self.create_from_hook(params, post)
    post.categories.destroy_all

    params&.each do |param|
      existing_category = Category.where(term_wp_id: param[1].dig('term_id'))
      parent = Category.where(term_wp_id: param[1].dig('parent'))

      if existing_category.empty?
        @category = Category.new

        @category.term_wp_id = param[1].dig('term_id')
        @category.name = param[1].dig('name')
        @category.slug = param[1].dig('slug')
        @category.term_group = param[1].dig('term_group')
        @category.term_taxonomy_id = param[1].dig('term_taxonomy_id')
        @category.description = param[1].dig('description')
        @category.parent_wp_id = param[1].dig('parent')
        @category.count = param[1].dig('count')
        @category.filter = param[1].dig('filter')
        @category.taxonomy = param[1].dig('taxonomy')

        @category.parent = parent.first unless parent.empty?

        if @category.save
          post.categories << @category
          @category
        else
          raise ActiveRecord::RecordNotSaved, 'STOP Wordpress category creation' \
                                              'Wordpress category can not be saved'
        end
      else
        puts 'Updating...'
        update_from_hook(param, existing_category.first, post, parent)
      end
    end
  end

  def self.update_from_hook(param, existing_category, post, parent)
    existing_category.parent = parent.first unless parent.empty?

    existing_category.description = param[1].dig('description')
    existing_category.count = param[1].dig('count')

    if existing_category.save
      post.categories << existing_category
      existing_category
    else
      raise ActiveRecord::RecordNotSaved, 'STOP Wordpress category update' \
                                          'Wordpress category can not be updated'
    end
  end
end
