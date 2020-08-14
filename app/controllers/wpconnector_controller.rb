class WpconnectorController < ApplicationController
  include WpWebhookEndpoint
  skip_before_action :verify_authenticity_token

  def model_create
    existing_post = Post.where(post_wp_id: JSON.parse(params.to_json).dig('post_id'))
    if existing_post.empty? 
      model = params[:model].classify.constantize
      render_json_200_or_404 model.create_from_hook(params)
    end
  end

  def model_update
    existing_post = Post.where(post_wp_id: JSON.parse(params.to_json).dig('post_id'))
    unless existing_post.empty?
      model = params[:model].classify.constantize
      render_json_200_or_404 model.update_from_hook(params, existing_post.first)
    end
  end

  def model_delete
    model = params[:model].constantize
    render_json_200_or_404 model.purge(wp_id_from_params)
  end
end