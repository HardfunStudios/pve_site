# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Wpconnectors', type: :request do
  let(:filepath1) { Rails.root.join('spec/fixtures/post_sample1.json') }
  let(:filepath1_copy) { Rails.root.join('spec/fixtures/post_sample1_copy.json') }

  it 'creates a new post from webhook' do
    expect do
      post '/wp-post-webhook/post', params: JSON.parse(File.read(filepath1))
    end.to(change { Post.count })
  end

  context 'when posting existing content' do
    before do
      post '/wp-post-webhook/post', params: JSON.parse(File.read(filepath1))
    end

    it 'does not create another post' do
      expect do
        post '/wp-post-webhook/post', params: JSON.parse(File.read(filepath1_copy))
      end.not_to(change { Post.count })
    end

    it 'updates the post from webhook' do
      id = 30 # id from post file on wordpress
      post_before = Post.where(wp_id: id).first
      post '/wp-post-webhook/post', params: JSON.parse(File.read(filepath1_copy))
      post_after = Post.where(wp_id: id).first
      expect(post_before.post_title).not_to eql post_after.post_title
    end
  end
end
