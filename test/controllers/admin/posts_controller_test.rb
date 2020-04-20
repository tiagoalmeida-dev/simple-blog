require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:first)
    @author = authors(:first)
    login_with accounts(:default)
  end

  test "should list all posts" do
    get admin_author_posts_url(@post.author), params: {author_id: @author.id}
    assert_response :success
  end

  test "should get a new post" do
    get new_admin_author_post_url(@post.author), params: {author_id: @author.id}
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post admin_author_posts_url(@post.author), params: {post: {title: 'New post', body: @post.body}, author_id: @author.id}
    end

    assert_redirected_to admin_author_posts_url
  end

  test "not should create a invalid post" do
    post admin_author_posts_url(@post.author), params: {post: {title: '', body: @post.body}, author_id: @author.id}
    assert_template :new
  end

  test "should edit a post" do
    get edit_admin_author_post_url(@post.author, @post), params: {author_id: @author.id}
    assert_response :success
  end

  test "should update a post" do
    patch admin_author_post_url(@post.author, @post), params: {post: {title: 'Update post', body: @post.body, author_id: @author.id}}
    assert_redirected_to admin_author_posts_url(@post.author)
  end

  test "should delete a post" do
    assert_difference('Post.count', -1) do
      delete admin_author_post_url(@post.author, @post), params: {author_id: @author.id}
    end

    assert_redirected_to admin_author_posts_url(@post.author)
  end
end
