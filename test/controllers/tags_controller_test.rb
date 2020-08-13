require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test "should get index" do
    get tags_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_url
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post tags_url, params: { tag: { count: @tag.count, description: @tag.description, filter: @tag.filter, name: @tag.name, parent_id: @tag.parent_id, parent_wp_id: @tag.parent_wp_id, slug: @tag.slug, taxonomy: @tag.taxonomy, term_group: @tag.term_group, term_taxonomy_id: @tag.term_taxonomy_id, term_wp_id: @tag.term_wp_id } }
    end

    assert_redirected_to tag_url(Tag.last)
  end

  test "should show tag" do
    get tag_url(@tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_url(@tag)
    assert_response :success
  end

  test "should update tag" do
    patch tag_url(@tag), params: { tag: { count: @tag.count, description: @tag.description, filter: @tag.filter, name: @tag.name, parent_id: @tag.parent_id, parent_wp_id: @tag.parent_wp_id, slug: @tag.slug, taxonomy: @tag.taxonomy, term_group: @tag.term_group, term_taxonomy_id: @tag.term_taxonomy_id, term_wp_id: @tag.term_wp_id } }
    assert_redirected_to tag_url(@tag)
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete tag_url(@tag)
    end

    assert_redirected_to tags_url
  end
end
