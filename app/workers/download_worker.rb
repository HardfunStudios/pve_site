# frozen_string_literal: true

require 'open-uri'

class DownloadWorker
  include Sidekiq::Worker

  def perform(filename, url)
    open('app/assets/images/posts/' + filename, 'wb') do |file|
      file << File.open(url).read
    end
  rescue StandardError => e
    Rails.logger.error e
  end
end
