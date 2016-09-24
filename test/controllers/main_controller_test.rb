require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get rank" do
    get :rank
    assert_response :success
  end

  test "should get regist" do
    get :regist
    assert_response :success
  end

  test "should get regist_complete" do
    get :regist_complete
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get admin_complete" do
    get :admin_complete
    assert_response :success
  end

end
