require 'test_helper'

class TextContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @text_content = text_contents(:one)
  end

  test "should get index" do
    get text_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_text_content_url
    assert_response :success
  end

  test "should create text_content" do
    assert_difference('TextContent.count') do
      post text_contents_url, params: { text_content: { content: @text_content.content, post_id: @text_content.post_id } }
    end

    assert_redirected_to text_content_url(TextContent.last)
  end

  test "should show text_content" do
    get text_content_url(@text_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_text_content_url(@text_content)
    assert_response :success
  end

  test "should update text_content" do
    patch text_content_url(@text_content), params: { text_content: { content: @text_content.content, post_id: @text_content.post_id } }
    assert_redirected_to text_content_url(@text_content)
  end

  test "should destroy text_content" do
    assert_difference('TextContent.count', -1) do
      delete text_content_url(@text_content)
    end

    assert_redirected_to text_contents_url
  end
end
