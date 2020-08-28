Rails.application.routes.draw do
  resources :attached_files
  resources :image_files
  resources :text_contents
  resources :videos
  get 'pages/home'
  resources :tags
  resources :categories
  resources :posts
  
  # wp-connector endpoints
  match 'wp-post-webhook/:model', to: 'wpconnector#model_create', via: [:head, :post]
  match 'wp-put-webhook/:model', to: 'wpconnector#model_update', via: [:put]

  root to: "pages#home"
  
  get 'portal', to: 'pages#portal'
end
