class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category

  def self.create_relationship(category, post)
    existing_relationship = PostCategory.where(post_id: post.id, category_id: category.id)

    if existing_relationship.empty?
      post_category = PostCategory.new

      post_category.post_id = post.id
      post_category.category_id = category.id

      if post_category.save
        post_category
      else
        raise ActiveRecord::RecordNotSaved.new "STOP Wordpress relationship between post and category creation" +
          "Wordpress relationship can not be created"
      end
    else
      self.update_relationship(existing_relationship, post, category)
    end
  end

  def self.update_relationship(existing_relationship, post, category)
    

  end
end
