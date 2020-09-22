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
    when '5'
      'Telas Abertas'
    when '6'
      'Dicas para Família'
    when '7'
      'Eleições'
    when '8'
      'Oportunidades Formativas'  
    when '9'
      'Telas Abertas'
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
    when '5'
      'material-computer'
    when '6'
      'simple-hipchat'
    when '7'
      'awesome-newspaper'
    when '8'
      'graduate-v'  
    when '9'
      'material-computer-v'
    else
      'simple-docusign'
    end 
  end
  
  def category_image_prof
    case @post.category_number
    when '1'
      'graduate-v'  
    when '5'
      'material-computer-v'
    else
      'material-computer-v'
    end 
  end
end
