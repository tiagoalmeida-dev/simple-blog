require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:first)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get a post" do
    get post_url(@post)
    assert_response :success
  end
end
