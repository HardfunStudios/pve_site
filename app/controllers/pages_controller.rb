# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :home

  @@limit = 6
  def home
    @q = Post.ransack(params[:q])
    post_escolas = Post.joins(:categories).where('categories.name': 'escolas_atendidas').order("created_at").last
    post_alunos = Post.joins(:categories).where('categories.name': 'alunos_impactados').order("created_at").last
    post_municipios = Post.joins(:categories).where('categories.name': 'municipios_atendidos').order("created_at").last    
    post_pessoas = Post.joins(:categories).where('categories.name': 'pessoas_mobilizadas').order("created_at").last

    regex = /(?<=\<p>).+?(?=\<\/p>)/

    @escolas = post_escolas.post_content.match(regex)
    @alunos = post_alunos.post_content.match(regex)
    @municipios = post_municipios.post_content.match(regex)
    @pessoas = post_pessoas.post_content.match(regex)
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
    respond_to do |format|
      format.html
      format.js
    end
  end
end
