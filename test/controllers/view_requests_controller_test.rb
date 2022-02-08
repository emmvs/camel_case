require "test_helper"

class ViewRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @view_request = view_requests(:one)
  end

  test "should get index" do
    get view_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_view_request_url
    assert_response :success
  end

  test "should create view_request" do
    assert_difference('ViewRequest.count') do
      post view_requests_url, params: { view_request: {  } }
    end

    assert_redirected_to view_request_url(ViewRequest.last)
  end

  test "should show view_request" do
    get view_request_url(@view_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_view_request_url(@view_request)
    assert_response :success
  end

  test "should update view_request" do
    patch view_request_url(@view_request), params: { view_request: {  } }
    assert_redirected_to view_request_url(@view_request)
  end

  test "should destroy view_request" do
    assert_difference('ViewRequest.count', -1) do
      delete view_request_url(@view_request)
    end

    assert_redirected_to view_requests_url
  end
end
