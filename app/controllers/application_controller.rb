# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :color_header, :turn_turbolinks
  
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
  
  def turn_turbolinks
    @is_on = 'true'
    @is_on = 'false' if (params[:controller] == 'posts' && params[:action].start_with?('show'))
  end
end
