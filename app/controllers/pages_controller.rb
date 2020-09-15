# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @q = Post.ransack(params[:q])
  end

  def portal
    @posts = Post.order(:created_at).limit(6)
  end
  
  def pve; end
  
  def gestores
    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Webinar%').limit(6)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%PVE2020%').limit(6)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Uncategorized%').limit(6)
  end
end
