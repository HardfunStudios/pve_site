require 'test_helper'

class ImageFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_file = image_files(:one)
  end

  test 'should get index' do
    get image_files_url
    assert_response :success
  end

  test 'should get new' do
    get new_image_file_url
    assert_response :success
  end

  test 'should create image_file' do
    assert_difference('ImageFile.count') do
      post image_files_url, params: { image_file: { local_url: @image_file.local_url, origin_url: @image_file.origin_url } }
    end

    assert_redirected_to image_file_url(ImageFile.last)
  end

  test 'should show image_file' do
    get image_file_url(@image_file)
    assert_response :success
  end

  test 'should get edit' do
    get edit_image_file_url(@image_file)
    assert_response :success
  end

  test 'should update image_file' do
    patch image_file_url(@image_file), params: { image_file: { local_url: @image_file.local_url, origin_url: @image_file.origin_url } }
    assert_redirected_to image_file_url(@image_file)
  end

  test 'should destroy image_file' do
    assert_difference('ImageFile.count', -1) do
      delete image_file_url(@image_file)
    end

    assert_redirected_to image_files_url
  end
end
