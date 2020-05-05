require "application_system_test_case"

class VerbalMarksTest < ApplicationSystemTestCase
  setup do
    @verbal_mark = verbal_marks(:one)
  end

  test "visiting the index" do
    visit verbal_marks_url
    assert_selector "h1", text: "Verbal Marks"
  end

  test "creating a Verbal mark" do
    visit verbal_marks_url
    click_on "New Verbal Mark"

    fill_in "Comment", with: @verbal_mark.comment_id
    fill_in "Post", with: @verbal_mark.post_id
    fill_in "User", with: @verbal_mark.user_id
    fill_in "Verbal mark", with: @verbal_mark.verbal_mark
    click_on "Create Verbal mark"

    assert_text "Verbal mark was successfully created"
    click_on "Back"
  end

  test "updating a Verbal mark" do
    visit verbal_marks_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @verbal_mark.comment_id
    fill_in "Post", with: @verbal_mark.post_id
    fill_in "User", with: @verbal_mark.user_id
    fill_in "Verbal mark", with: @verbal_mark.verbal_mark
    click_on "Update Verbal mark"

    assert_text "Verbal mark was successfully updated"
    click_on "Back"
  end

  test "destroying a Verbal mark" do
    visit verbal_marks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Verbal mark was successfully destroyed"
  end
end
