# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def portal
    @posts = Post.order(:created_at).limit(6)
  end
end
