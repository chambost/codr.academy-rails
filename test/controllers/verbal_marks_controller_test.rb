require 'test_helper'

class VerbalMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verbal_mark = verbal_marks(:one)
  end

  test "should get index" do
    get verbal_marks_url
    assert_response :success
  end

  test "should get new" do
    get new_verbal_mark_url
    assert_response :success
  end

  test "should create verbal_mark" do
    assert_difference('VerbalMark.count') do
      post verbal_marks_url, params: { verbal_mark: { comment_id: @verbal_mark.comment_id, post_id: @verbal_mark.post_id, user_id: @verbal_mark.user_id, verbal_mark: @verbal_mark.verbal_mark } }
    end

    assert_redirected_to verbal_mark_url(VerbalMark.last)
  end

  test "should show verbal_mark" do
    get verbal_mark_url(@verbal_mark)
    assert_response :success
  end

  test "should get edit" do
    get edit_verbal_mark_url(@verbal_mark)
    assert_response :success
  end

  test "should update verbal_mark" do
    patch verbal_mark_url(@verbal_mark), params: { verbal_mark: { comment_id: @verbal_mark.comment_id, post_id: @verbal_mark.post_id, user_id: @verbal_mark.user_id, verbal_mark: @verbal_mark.verbal_mark } }
    assert_redirected_to verbal_mark_url(@verbal_mark)
  end

  test "should destroy verbal_mark" do
    assert_difference('VerbalMark.count', -1) do
      delete verbal_mark_url(@verbal_mark)
    end

    assert_redirected_to verbal_marks_url
  end
end
