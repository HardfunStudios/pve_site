Rails.application.routes.draw do
  resources :posts
  
  # wp-connector endpoints
  match 'test-webhook/:model', to: 'wpconnector#model_save', via: [:head, :post]
  
  root to: "posts#index"
end
