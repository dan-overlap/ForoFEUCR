require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { author_id: @comment.author_id, body: @comment.body, denounced: @comment.denounced, dislikes_id: @comment.dislikes_id, is_important: @comment.is_important, is_inappropriate: @comment.is_inappropriate, likes_id: @comment.likes_id, replies_id: @comment.replies_id, reviewed: @comment.reviewed, title: @comment.title } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { author_id: @comment.author_id, body: @comment.body, denounced: @comment.denounced, dislikes_id: @comment.dislikes_id, is_important: @comment.is_important, is_inappropriate: @comment.is_inappropriate, likes_id: @comment.likes_id, replies_id: @comment.replies_id, reviewed: @comment.reviewed, title: @comment.title } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
