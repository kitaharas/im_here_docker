require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get feel" do
    get home_feel_url
    assert_response :success
  end

  test "should get genre" do
    get home_genre_url
    assert_response :success
  end

  test "should get mypage" do
    get home_mypage_url
    assert_response :success
  end

end
