require 'test_helper'

class AttachedFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attached_file = attached_files(:one)
  end

  test "should get index" do
    get attached_files_url
    assert_response :success
  end

  test "should get new" do
    get new_attached_file_url
    assert_response :success
  end

  test "should create attached_file" do
    assert_difference('AttachedFile.count') do
      post attached_files_url, params: { attached_file: { file_type: @attached_file.file_type, local_url: @attached_file.local_url, origin_url: @attached_file.origin_url } }
    end

    assert_redirected_to attached_file_url(AttachedFile.last)
  end

  test "should show attached_file" do
    get attached_file_url(@attached_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_attached_file_url(@attached_file)
    assert_response :success
  end

  test "should update attached_file" do
    patch attached_file_url(@attached_file), params: { attached_file: { file_type: @attached_file.file_type, local_url: @attached_file.local_url, origin_url: @attached_file.origin_url } }
    assert_redirected_to attached_file_url(@attached_file)
  end

  test "should destroy attached_file" do
    assert_difference('AttachedFile.count', -1) do
      delete attached_file_url(@attached_file)
    end

    assert_redirected_to attached_files_url
  end
end
