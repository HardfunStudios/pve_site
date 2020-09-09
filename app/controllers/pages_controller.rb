# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @q = Post.ransack(params[:q])
  end

  def portal
    @posts = Post.order(:created_at).limit(6)
  end
  
  def pve; end
end
