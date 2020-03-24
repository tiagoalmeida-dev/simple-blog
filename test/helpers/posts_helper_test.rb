require 'test_helper'

class PostsHelperTest < ActionView::TestCase
  test "format date" do
    assert_equal "25 Jan, 2019", pretty_date(Date.parse("25-01-2019"))
  end
end
