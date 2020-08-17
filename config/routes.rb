Rails.application.routes.draw do
  get 'pages/home'
  resources :tags
  resources :categories
  resources :posts
  
  # wp-connector endpoints
  match 'wp-post-webhook/:model', to: 'wpconnector#model_create', via: [:head, :post]
  match 'wp-put-webhook/:model', to: 'wpconnector#model_update', via: [:head, :post]

  root to: "pages#home"
end
