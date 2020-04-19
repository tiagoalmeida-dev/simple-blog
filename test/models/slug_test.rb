require 'test_helper'

class SlugTest < ActiveSupport::TestCase
  test "should make a slub by title" do

    assert_equal "some-text", Slug.new("some text").value
    assert_equal "some-text-at-2020", Slug.new("some text @ 2020").value
    assert_equal "some-and-text", Slug.new("some & text").value
    assert_equal "some-and-text", Slug.new(" some__&--text ").value
  end
end
