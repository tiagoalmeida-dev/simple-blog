require 'test_helper'

class PostsHelperTest < ActionView::TestCase
  test "format date" do
    assert_equal "25 Jan, 2019", pretty_date(Date.parse("25-01-2019"))
  end

  test "not sould limit the text" do
    assert_equal "tiny text", limit_text("tiny text", 9)
  end

  test "limit text and add a sulfix" do
    assert_equal "tiny...", limit_text("tiny text", 4)
  end

  test "limit text with a custom sulfix" do
    assert_equal "tiny+++", limit_text("tiny text", 4, "+++")
  end
end
