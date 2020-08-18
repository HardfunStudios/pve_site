class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag

  def self.create_relationship(tag, post)
    existing_relationship = PostTag.where(post_id: post.id, tag_id: tag.id)

    if existing_relationship.empty?
      post_tag = PostTag.new

      post_tag.post_id = post.id
      post_tag.tag_id = tag.id

      if post_tag.save
        post_tag
      else
        raise ActiveRecord::RecordNotSaved.new "STOP Wordpress relationship between post and tag creation" +
          "Wordpress relationship can not be created"
      end
    #else
      #self.update_relationship(existing_relationship, post, category)
    end
  end
end
