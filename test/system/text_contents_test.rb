require "application_system_test_case"

class TextContentsTest < ApplicationSystemTestCase
  setup do
    @text_content = text_contents(:one)
  end

  test "visiting the index" do
    visit text_contents_url
    assert_selector "h1", text: "Text Contents"
  end

  test "creating a Text content" do
    visit text_contents_url
    click_on "New Text Content"

    fill_in "Content", with: @text_content.content
    fill_in "Post", with: @text_content.post_id
    click_on "Create Text content"

    assert_text "Text content was successfully created"
    click_on "Back"
  end

  test "updating a Text content" do
    visit text_contents_url
    click_on "Edit", match: :first

    fill_in "Content", with: @text_content.content
    fill_in "Post", with: @text_content.post_id
    click_on "Update Text content"

    assert_text "Text content was successfully updated"
    click_on "Back"
  end

  test "destroying a Text content" do
    visit text_contents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Text content was successfully destroyed"
  end
end
