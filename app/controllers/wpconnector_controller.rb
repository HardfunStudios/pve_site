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
  
  def redirect_wppost
    splitted_params = params[:dt].split('/')
    month = splitted_params[0]
    day = splitted_params[1]
    title = splitted_params[2]
    unless title.nil?
      year = request.original_fullpath[1..4]
      date = (year + '-' + month + '-' + day).to_date
      posts = Post.where(post_date_gmt: date.beginning_of_day..date.end_of_day)
      posts&.each do |post|
        #norm_title = I18n.transliterate(post.post_title.downcase!).gsub(':', '').gsub(' ', '-')
        norm_title = post.post_name
        if norm_title == title
          case post.category_number
            when '0'
              return redirect_to post_path(post, cat: 'gestores')
            when '1'
              return redirect_to post_path(post, cat: 'professores')
            when '2'
              return redirect_to post_path(post, cat: 'familias')
            when '3'
              return redirect_to post_path(post, cat: 'mobilizadores')
            when '4'
              return redirect_to post_path(post, cat: 'professores')
            when '5'
              return redirect_to post_path(post, cat: 'familias')
            when '6'
              return redirect_to post_path(post, cat: 'familias')
            when '7'
              return redirect_to post_path(post, cat: 'familias')
          end
          
        end
      end
    end
    head :not_found
  end
end