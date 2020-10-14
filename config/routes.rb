# frozen_string_literal: true

Rails.application.routes.draw do
  resources :attached_files
  resources :image_files
  resources :text_contents
  resources :videos
  get 'pages/home'
  resources :tags
  resources :categories
  resources :posts do
    collection do
      match 'search' => 'posts#search', via: %i[get post], as: :search
    end
  end

  # wp-connector endpoints
  match 'wp-post-webhook/:model', to: 'wpconnector#model_create', via: %i[head post]
  match 'wp-put-webhook/:model', to: 'wpconnector#model_update', via: [:put]

  root to: 'pages#home'

  get 'portal', to: 'pages#portal'
  get 'pve', to: 'pages#pve'
  get 'gestores', to: 'pages#gestores'
  get 'mobilizadores', to: 'pages#mobilizadores'
  get 'familias', to: 'pages#familias'
  get 'professores', to: 'pages#professores'
  get 'news', to: 'pages#news'
  
  get '/termos-e-condicoes-de-uso', as: :terms, to: 'pages#terms'
  get '/politica-de-privacidade-e-protecao-de-dados-do-pve', as: :privacy, to: 'pages#privacy'
  
  get '2020/*dt', to: "wpconnector#redirect_wppost"
  get '2019/*dt', to: "wpconnector#redirect_wppost"
  get '2018/*dt', to: "wpconnector#redirect_wppost"
end
