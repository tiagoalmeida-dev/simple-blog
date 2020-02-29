require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should get post by authors" do
    author_id = authors(:first).id
    assert_equal 2, Post.with_author(author_id).count
  end
end
