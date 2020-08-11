class PostsController < ApplicationController

    def new
        @post = Wordpress::Post.new
    end
      
    # Simply call #save on the newly created post
    def create
        begin
            @post = Wordpress::Post.new(post_params)
            @post.save!
            redirect_to post_path(@post), notice: 'Post was successfully created.'
        rescue
            render action: 'new'
        end
    end
      
    # This is an example of how to "revert" to an earlier version of the post
    def revert
        revision = Wordpress::Revision.find(params[:id])
        revision.update_attribute(:post_modified, Time.now)
        redirect_to edit_post_path(revision.parent)
    end
      
    # Note the use of "new_revision" against the post to save!
    def update
        begin
            @post.new_revision(post_params).save!
            redirect_to post_path(@post), notice: 'Post was successfully updated.'
        rescue
            render action: 'edit'
        end
    end
      
    def set_post
        @post = Wordpress::Post.find(params[:id])
        @title = @post.title
    end
      
    def post_params
        params[:post].permit(:post_title, :post_content, :post_excerpt, :post_tags, :post_categories => [])
    end
end
