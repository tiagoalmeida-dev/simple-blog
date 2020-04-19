require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:first)
    login_with accounts(:default)
  end

  test "should get new" do
    get new_admin_author_url
    assert_response :success
  end

  test "should create author with account" do
    assert_difference('Author.count') do
      post admin_authors_url, params: { author: { name: @author.name,
                                            account_attributes: { email: "create@email.com", password: 'secret', password_confirmation: 'secret' } } }
    end

    assert_redirected_to admin_author_posts_url(Author.last)
  end

  test "should get edit" do
    get edit_admin_author_url(@author), params: { id: @author.id }
    assert_response :success
  end

  test "should update author" do
    patch admin_author_url(@author), params: { author: { name: @author.name,
                                                   account_attributes: { email: "new@email.com", password: 'secret', password_confirmation: 'secret' } }, id: @author.id  }
    assert_redirected_to admin_author_url(@author)
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete admin_author_url(@author), params: {id: @author.id}
    end

    assert_redirected_to new_admin_author_url
  end
end
