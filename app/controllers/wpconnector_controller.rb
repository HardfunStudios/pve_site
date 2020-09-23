# frozen_string_literal: true

class WpconnectorController < ApplicationController
  include WpWebhookEndpoint
  #skip_before_action :verify_authenticity_token

  def model_create
    model = params[:model].classify.constantize
    id_field = params[:model].downcase + '_id'
    existing_records = model.where(wp_id: JSON.parse(params.to_json).dig(id_field))
    if existing_records.empty?
      render_json_200_or_404 model.create_from_hook(params)
    else
      render_json_200_or_404 model.update_from_hook(params, existing_records.first)
    end
  end

  def model_update
    puts 'Update hook invoked! Nothing to do here!'
  end

  def model_delete
    model = params[:model].constantize
    render_json_200_or_404 model.purge(wp_id_from_params)
  end
end
