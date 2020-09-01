# frozen_string_literal: true

require 'mysql2'
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:filepath1) { Rails.root.join('spec/fixtures/post_sample1.json') }
  let(:filepath2) { Rails.root.join('spec/fixtures/post_sample2.json') }

  before do
    @post_only_image = Post.create_from_hook(JSON.parse(File.read(filepath1)))
    @post_text = Post.create_from_hook(JSON.parse(File.read(filepath2)))
  end

  context 'validations' do
    it 'must have a content' do
      post_nil = Post.new(post_content: nil)
      expect(post_nil).to_not be_valid
    end

    it 'must have content, title and id from wordpress' do
      expect(@post_only_image).to be_valid
      expect(@post_text).to be_valid
    end
  end

  context 'post contents' do
    it 'must have text contents' do
      expect(@post_text.text_contents).not_to be_empty
    end

    it 'must have images' do
      expect(@post_only_image.image_files).not_to be_empty
    end

    it 'does not have image' do
      expect(@post_text.image_files).to be_empty
    end

    it 'do not have video' do
      expect(@post_text.videos).to be_empty
    end

    it 'do not have files' do
      expect(@post_text.attached_files).to be_empty
      expect(@post_only_image.attached_files).to be_empty
    end
  end

  context 'taxonomies' do
    it 'have categories' do
      expect(@post_only_image.categories).not_to be_empty
      expect(@post_text.categories).not_to be_empty
    end

    it 'have tags' do
      expect(@post_only_image.tags).not_to be_empty
      expect(@post_text.tags).not_to be_empty
    end
  end
end
