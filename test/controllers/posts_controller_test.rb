require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    login_with accounts(:default)
  end

  test "should list all posts" do
    get posts_url
    assert_response :success
  end

  test "should get a new post" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: {post: {title: 'New post', body: @post.body}}
    end

    assert_redirected_to posts_url
  end

  test "not should create a invalid post" do
    post posts_url, params: {post: {title: '', body: @post.body}}
    assert_template :new
  end

end
