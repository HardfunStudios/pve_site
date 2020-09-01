# frozen_string_literal: true
require 'mysql2'
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'must have a content' do
    post = Post.new(post_content: nil)
    expect(post).to_not be_valid
  end
end
