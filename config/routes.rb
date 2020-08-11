Rails.application.routes.draw do
  # wp-connector endpoints
  match 'test-webhook/:model', to: 'wpconnector#model_save', via: [:head, :post]
end
