require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:first)
    login_with accounts(:default)
  end

  test "should list all posts" do
    get author_posts_url(@post.author)
    assert_response :success
  end

  test "should get a post" do
    get author_post_url(@post.author, @post)
    assert_response :success
  end

  test "should get a new post" do
    get new_author_post_url(@post.author)
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post author_posts_url(@post.author), params: {post: {title: 'New post', body: @post.body}}
    end

    assert_redirected_to author_posts_url
  end

  test "not should create a invalid post" do
    post author_posts_url(@post.author), params: {post: {title: '', body: @post.body}}
    assert_template :new
  end
end
