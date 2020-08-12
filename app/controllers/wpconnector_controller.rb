class WpconnectorController < ApplicationController
  include WpWebhookEndpoint
  skip_before_action :verify_authenticity_token

  def model_create
    model = params[:model].classify.constantize
    render_json_200_or_404 model.create_from_hook(params)
  end

  def model_update
    model = params[:model].classify.constantize
    render_json_200_or_404 model.update_from_hook(params)
  end

  def model_delete
    model = params[:model].constantize
    render_json_200_or_404 model.purge(wp_id_from_params)
  end
end