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

    @escolas = post_escolas.post_content.match(regex) unless post_escolas.nil?
    @alunos = post_alunos.post_content.match(regex) unless post_alunos.nil?
    @municipios = post_municipios.post_content.match(regex) unless post_municipios.nil?
    @pessoas = post_pessoas.post_content.match(regex) unless post_pessoas.nil?
  end

  def portal
    @posts = Post.order(:created_at).limit(6)
  end
  
  def pve; end
  
  def terms; end

  def privacy; end
  
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
  
  def news
    @posts = Post.joins(:categories).where('categories.name LIKE ?', '%Notícias%').order(post_date_gmt: :desc).limit(5)
    @webinars = Post.joins(:categories).where('categories.name LIKE ?', '%Webinar%').order(post_date_gmt: :desc).limit(3)
    @telas = Post.joins(:categories).where('categories.name LIKE ?', '%Telas%').order(post_date_gmt: :desc).limit(3)
    @oportunidades = Post.joins(:categories).where('categories.name LIKE ?', '%Oportunidades%').order(post_date_gmt: :desc).limit(3)
    @interessantes = Post.joins(:categories).where('categories.name LIKE ?', '%Dicas%').order(post_date_gmt: :desc).limit(2)
    @interessantes += Post.joins(:categories).where('categories.name LIKE ?', '%Conteúdos%').order(post_date_gmt: :desc).limit(1)
    @cat = 'gestores'
    respond_to do |format|
      format.html
      format.js
    end
  end
end
