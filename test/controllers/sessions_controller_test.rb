require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get create" do
    @account = accounts(:one)
    post sessions_url, params: { email: @account.email, password: 'secret', password_confirmation: 'secret' }

    assert_redirected_to root_url
  end

  test "should get destroy" do
    login_with accounts(:default)

    get root_url
    assert_response :success
  end

end
