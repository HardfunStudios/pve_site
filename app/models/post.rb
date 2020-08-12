class Post < ActiveRecord::Base
    
  def self.schedule_create_or_update(wp_id_from_params, params)
    puts "=================================="
    puts wp_id_from_params
    puts "-------"
    puts params.to_json
  end
  
end
