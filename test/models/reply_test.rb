require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "saves valid objects" do
    user = users(:one)
    topic = topics(:one)

    reply = Reply.new(content: "An interesting question...", user: user, post: topic)
    assert_equal true, reply.save
  end

  test "does not save object with no attributes" do
    reply = Reply.new
    assert_equal false, reply.save
  end

  test "does not save object missing a user" do
    topic = topics(:one)

    reply = Reply.new(content: "An interesting question...", post: topic)
    assert_equal false, reply.save
  end

  test "does not save a reply missing content" do
    user = users(:one)
    topic = topics(:one)

    reply = Reply.new(user: user, post: topic)
    assert_equal false, reply.save
  end

  test "does not save a reply missing a post" do
    user = users(:one)

    reply = Reply.new(user: user, content: "An interesting question...")
    assert_equal false, reply.save
  end
end
