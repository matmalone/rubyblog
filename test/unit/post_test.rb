require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post won't save with a title only" do
    post = Post.new
    post.title = 'test title'
    assert !post.save, "Saved posted without a name"
  end

  test "post won't save with a name only" do
    post = Post.new
    post.name = 'test name'
    assert !post.save, "Saved post without a title"
  end

  test "post will save with a name and a title" do
    post = Post.new
    post.name = 'test name'
    post.title = 'test title'
    assert post.save
  end
end
