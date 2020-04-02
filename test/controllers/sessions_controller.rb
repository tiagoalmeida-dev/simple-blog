require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should log in the application" do
    @account = accounts(:default)
    post sessions_url, params: { email: @account.email, password: 'secret'}

    assert_redirected_to admin_author_posts_url(@account.author)
  end

  test "should return a error message" do
    @account = accounts(:default)
    post sessions_url, params: { email: @account.email, password: ''}

    assert_equal 'Unable to log in. Please check your credentials and try again.', flash[:alert]
    assert_redirected_to login_url
  end

  test "should get destroy" do
    login_with accounts(:default)

    get root_url
    assert_response :success
  end
end
