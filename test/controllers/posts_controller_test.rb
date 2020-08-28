require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { comment_count: @post.comment_count, comment_status: @post.comment_status, filter: @post.filter, guid: @post.guid, menu_order: @post.menu_order, ping_status: @post.ping_status, post_author: @post.post_author, post_content: @post.post_content, post_content_filtered: @post.post_content_filtered, post_date_gmt: @post.post_date_gmt, post_excerpt: @post.post_excerpt, post_meta: @post.post_meta, post_mime_type: @post.post_mime_type, post_modified: @post.post_modified, post_modified_gmt: @post.post_modified_gmt, post_nama: @post.post_nama, post_parent: @post.post_parent, post_status: @post.post_status, post_thumbnail: @post.post_thumbnail, post_title: @post.post_title, post_type: @post.post_type, post_wp_id: @post.post_wp_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { comment_count: @post.comment_count, comment_status: @post.comment_status, filter: @post.filter, guid: @post.guid, menu_order: @post.menu_order, ping_status: @post.ping_status, post_author: @post.post_author, post_content: @post.post_content, post_content_filtered: @post.post_content_filtered, post_date_gmt: @post.post_date_gmt, post_excerpt: @post.post_excerpt, post_meta: @post.post_meta, post_mime_type: @post.post_mime_type, post_modified: @post.post_modified, post_modified_gmt: @post.post_modified_gmt, post_nama: @post.post_nama, post_parent: @post.post_parent, post_status: @post.post_status, post_thumbnail: @post.post_thumbnail, post_title: @post.post_title, post_type: @post.post_type, post_wp_id: @post.post_wp_id } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
