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
      
    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Webinar%').order(post_date_gmt: :desc).limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Oportunidades%').order(post_date_gmt: :desc).limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Notícias%').order(post_date_gmt: :desc).limit(@@limit)
    @cat = 'gestores'
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def mobilizadores
    @@limit = 6 if request.format.html?
    @@limit += 6 if request.format.js?

    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Conteúdos%').order(post_date_gmt: :desc).limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Materiais%').order(post_date_gmt: :desc).limit(@@limit)
    @cat = 'mobilizadores'
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def familias
    @@limit = 6 if request.format.html?
    @@limit += 6 if request.format.js?
      
    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Telas%').order(post_date_gmt: :desc).limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Dicas%').order(post_date_gmt: :desc).limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Eleições%').order(post_date_gmt: :desc).limit(@@limit)
    @cat = 'familias'
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def professores
    @@limit = 6 if request.format.html?
    @@limit += 6 if request.format.js?

    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Oportunidades%').order(post_date_gmt: :desc).limit(@@limit)
    @posts += Post.joins(:categories).where('categories.name LIKE ?', '%Telas%').order(post_date_gmt: :desc).limit(@@limit)
    @cat = 'professores'
    respond_to do |format|
      format.html
      format.js
    end
  end
end
