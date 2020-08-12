require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Comment count", with: @post.comment_count
    fill_in "Comment status", with: @post.comment_status
    fill_in "Filter", with: @post.filter
    fill_in "Guid", with: @post.guid
    fill_in "Menu order", with: @post.menu_order
    fill_in "Ping status", with: @post.ping_status
    fill_in "Post author", with: @post.post_author
    fill_in "Post content", with: @post.post_content
    fill_in "Post content filtered", with: @post.post_content_filtered
    fill_in "Post date gmt", with: @post.post_date_gmt
    fill_in "Post excerpt", with: @post.post_excerpt
    fill_in "Post meta", with: @post.post_meta
    fill_in "Post mime type", with: @post.post_mime_type
    fill_in "Post modified", with: @post.post_modified
    fill_in "Post modified gmt", with: @post.post_modified_gmt
    fill_in "Post nama", with: @post.post_nama
    fill_in "Post parent", with: @post.post_parent
    fill_in "Post status", with: @post.post_status
    fill_in "Post thumbnail", with: @post.post_thumbnail
    fill_in "Post title", with: @post.post_title
    fill_in "Post type", with: @post.post_type
    fill_in "Post wp", with: @post.post_wp_id
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Comment count", with: @post.comment_count
    fill_in "Comment status", with: @post.comment_status
    fill_in "Filter", with: @post.filter
    fill_in "Guid", with: @post.guid
    fill_in "Menu order", with: @post.menu_order
    fill_in "Ping status", with: @post.ping_status
    fill_in "Post author", with: @post.post_author
    fill_in "Post content", with: @post.post_content
    fill_in "Post content filtered", with: @post.post_content_filtered
    fill_in "Post date gmt", with: @post.post_date_gmt
    fill_in "Post excerpt", with: @post.post_excerpt
    fill_in "Post meta", with: @post.post_meta
    fill_in "Post mime type", with: @post.post_mime_type
    fill_in "Post modified", with: @post.post_modified
    fill_in "Post modified gmt", with: @post.post_modified_gmt
    fill_in "Post nama", with: @post.post_nama
    fill_in "Post parent", with: @post.post_parent
    fill_in "Post status", with: @post.post_status
    fill_in "Post thumbnail", with: @post.post_thumbnail
    fill_in "Post title", with: @post.post_title
    fill_in "Post type", with: @post.post_type
    fill_in "Post wp", with: @post.post_wp_id
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
