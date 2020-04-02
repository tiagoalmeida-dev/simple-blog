require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:first)
  end

  test "should get an author" do
    get author_url(@author)
    assert_response :success
  end
end
