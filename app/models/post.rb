class Post < ApplicationRecord
  
  def self.create_from_hook(params)
    puts "=================================="
    puts params.to_json
  end
  
  def self.update_from_hook(params)
    
  end
end
