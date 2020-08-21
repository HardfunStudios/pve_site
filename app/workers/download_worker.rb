# frozen_string_literal: true

require 'open-uri'

class DownloadWorker
  include Sidekiq::Worker

  def perform(id, url)
    open('app/assets/images/posts/' + id.to_s + File.extname(url), 'wb') do |file|
      file << open(url).read
    end
  end
end
