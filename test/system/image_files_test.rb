require "application_system_test_case"

class ImageFilesTest < ApplicationSystemTestCase
  setup do
    @image_file = image_files(:one)
  end

  test "visiting the index" do
    visit image_files_url
    assert_selector "h1", text: "Image Files"
  end

  test "creating a Image file" do
    visit image_files_url
    click_on "New Image File"

    fill_in "Local url", with: @image_file.local_url
    fill_in "Origin url", with: @image_file.origin_url
    click_on "Create Image file"

    assert_text "Image file was successfully created"
    click_on "Back"
  end

  test "updating a Image file" do
    visit image_files_url
    click_on "Edit", match: :first

    fill_in "Local url", with: @image_file.local_url
    fill_in "Origin url", with: @image_file.origin_url
    click_on "Update Image file"

    assert_text "Image file was successfully updated"
    click_on "Back"
  end

  test "destroying a Image file" do
    visit image_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Image file was successfully destroyed"
  end
end
