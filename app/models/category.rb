class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :post_categories
  has_many :posts, :through => :post_categories, :dependent => :destroy

  validates :name, uniqueness: true, presence: true

  def self.create_from_hook(params, post)

    params.each do |param|
      @category = Category.new

      existing_category = Category.where(term_wp_id: param[1].dig('term_id'))

      if existing_category.empty?

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

        if @category.save
          PostCategory.create_relationship(@category, post)
          @category
        else
          raise ActiveRecord::RecordNotSaved.new "STOP Wordpress category creation" +
            "Wordpress category can not be saved"
        end
      else
        puts "Updating..."
        self.update_from_hook(param, existing_category.first, post)
      end
    end
  end

  def self.update_from_hook(param, existing_category, post)
   
    existing_category.description = param[1].dig('description')
    existing_category.count = param[1].dig('count')

    if existing_category.save
      PostCategory.create_relationship(existing_category, post)
      existing_category
    else
      raise ActiveRecord::RecordNotSaved.new "STOP Wordpress category update" +
        "Wordpress category can not be updated"
    end
  end
end
