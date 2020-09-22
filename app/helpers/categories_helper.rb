# frozen_string_literal: true

module CategoriesHelper
  def big_category
    case @post.category_number
    when '0'
      'Webinar'
    when '1'
      'Oportunidades formativas'
    when '2'
      'Notícias'
    when '3'
      'Conteúdos de apoio'  
    when '4'
      'Materiais para baixar'
    end   
  end
  
  def category_image
    case @post.category_number
    when '0'
      'video-call'
    when '1'
      'graduate'
    when '2'
      'newspaper'
    when '3'
      'ios-document'  
    when '4'
      'simple-docusign'
    else
      'simple-docusign'
    end 
  end
end
