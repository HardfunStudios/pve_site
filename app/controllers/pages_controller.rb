# frozen_string_literal: true

class PagesController < ApplicationController
  @@limit = 6
  def home
    @q = Post.ransack(params[:q])
  end

  def portal
    @posts = Post.order(:created_at).limit(6)
  end
  
  def pve; end
  
  def gestores
    @@limit = 6 if request.format.html?
    @@limit += 6 if request.format.js?

    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Webinar%').limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%PVE2020%').limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Uncategorized%').limit(@@limit)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
