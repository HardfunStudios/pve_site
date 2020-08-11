class Post < ActiveRecord::Base
    include WpCache
    include WpPost
  
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
