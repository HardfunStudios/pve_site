# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :color_header
  
  private
  
  def color_header
    @color = 'bg-color-purple'
    if (params[:controller] == 'pages' && params[:action] == 'home')
      @color = 'bg-transparent'
    end
  end
end
