Rails.application.routes.draw do
  # wp-connector endpoints
  get    'test-webhook/:model', to: 'wpconnector#model_save'
end
