# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.increase_view
    @related = @post.related_posts
    puts @related.inspect
    case params[:cat]
    when 'gestores'
      @cat = 'gestores'
      render 'show_gestores'
    when 'mobilizadores'
      @cat = 'mobilizadores'
      render 'show_mobilizadores'
    end
    
  end

  def search
    puts 'TO DO - Render posts page'
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(:updated_at).limit(12)
    respond_to do |format|
      format.html
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:post_author, :post_date_gmt, :post_content, :post_title, :post_status, :post_excerpt, :comment_status, :ping_status, :post_name, :post_modified, :post_modified_gmt, :post_content_filtered, :post_parent, :wp_id, :menu_order, :guid, :post_type, :post_mime_type, :comment_count, :filter, :post_meta, :post_thumbnail)
  end
end
