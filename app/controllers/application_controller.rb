# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :color_header
  
  private
  
  def color_header
    @color = 'bg-header-gestores'
    if (params[:controller] == 'pages' && params[:action] == 'home')
      @color = 'bg-header-home'
    end
  end
end
