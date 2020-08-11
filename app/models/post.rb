class Post < ActiveRecord::Base
    include WpCache
    include WpPost
    
  def self.schedule_create_or_update(wp_id_from_params, params)
    puts "=================================="
    puts wp_id_from_params
    puts "-------"
    puts params
  end
  
    def update_wp_cache(json)
        puts json
        '''
        update_post(json)
        author = Author.find_or_create(json["author"]["ID"])
        author.update_wp_cache(json["author"])
        self.author = author
        self.save
        '''
    end
end
