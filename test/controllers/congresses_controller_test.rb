require 'test_helper'

class CongressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @congress = congresses(:one)
  end

  test "should get index" do
    get congresses_url
    assert_response :success
  end

  test "should get new" do
    get new_congress_url
    assert_response :success
  end

  test "should create congress" do
    assert_difference('Congress.count') do
      post congresses_url, params: { congress: { administrators_id: @congress.administrators_id, blog_id: @congress.blog_id, calendar_id: @congress.calendar_id, categories_id: @congress.categories_id, name: @congress.name, organizer: @congress.organizer, responsible_id: @congress.responsible_id } }
    end

    assert_redirected_to congress_url(Congress.last)
  end

  test "should show congress" do
    get congress_url(@congress)
    assert_response :success
  end

  test "should get edit" do
    get edit_congress_url(@congress)
    assert_response :success
  end

  test "should update congress" do
    patch congress_url(@congress), params: { congress: { administrators_id: @congress.administrators_id, blog_id: @congress.blog_id, calendar_id: @congress.calendar_id, categories_id: @congress.categories_id, name: @congress.name, organizer: @congress.organizer, responsible_id: @congress.responsible_id } }
    assert_redirected_to congress_url(@congress)
  end

  test "should destroy congress" do
    assert_difference('Congress.count', -1) do
      delete congress_url(@congress)
    end

    assert_redirected_to congresses_url
  end
end
