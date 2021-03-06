# frozen_string_literal: true

# Divides the content into specific models
class PostContentParserService
  def initialize(post)
    @post = post
    @parsed_data = Nokogiri::HTML.parse(post.post_content)
  end

  def execute
    parse_videos
    #parse_images - # not used for now
    #parse_files - # not used for now
    parse_texts
    @post.update_column(:post_content, @parsed_data.to_html)
  end

  def parse_videos
    # not used for now
    #@post.videos.destroy_all
    #content = @parsed_data.css('.wp-block-embed-youtube div')
    #unless content.empty?
    #  content.each do |video|
    #    @post.videos << Video.find_or_create_by(url: video.text.squish)
    #  end
    #end
    
    # format videos at center
    nodes = @parsed_data.css 'iframe'
    nodes.each_with_index do |n, i|
      n.add_next_sibling('<hr class="my-4">')
      if n.attributes['src'].value.include? 'youtube'
        n.set_attribute('id', 'ytplayer-' + (DateTime.now.to_i + i).to_s)
        n.set_attribute('src', n.attributes['src'].value + '?enablejsapi=1')
        n.set_attribute('class', 'youtube-iframe')
      end
    end
    nodes.wrap('<div class="flex flex-col items-center"></div>')
  end

  def parse_images
    @post.image_files.destroy_all
    content = @parsed_data.xpath('//img')
    unless content.empty?
      content.each do |img|
        @post.image_files << ImageFile.find_or_create_by(origin_url: img[:src])
      end
    end
  end

  def parse_texts
    # not used for now
    #@post.text_contents.destroy_all
    #content = @parsed_data.css('p')
    #unless content.empty?
    #  content.each do |txt|
    #    @post.text_contents << TextContent.create(content: txt.inner_html.squish) unless txt.text.blank?
    #  end
    #end
    
    # insert hr on h3 and h4
    nodes = @parsed_data.css 'h3, h4, h5'
    nodes.each do |n|
      n.add_previous_sibling('<hr class="my-4">')
    end
  end

  def parse_files
    @post.attached_files.destroy_all
    content = @parsed_data.css('.wp-block-file a')
    unless content.empty?
      content.each do |file|
        @post.attached_files << AttachedFile.find_or_create_by(origin_url: file[:href])
      end
    end
  end
end
