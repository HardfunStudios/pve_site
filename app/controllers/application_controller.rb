# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :color_header
  
  private
  
  def color_header
    @color = 'bg-header-gestores'
    @text_color = 'font-color-white'
    @logo_header = 'logo-header-white'
    if (params[:controller] == 'pages' && params[:action] == 'home')
      @color = 'bg-header-home'
      @text_color = 'font-color-purple'
      @logo_header = 'logo-header-purple'
    end
  end
end
