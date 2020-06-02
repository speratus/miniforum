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

  test "belongs to a user" do
    user = users(:reply_user)
    reply = replies(:belongs_test)

    assert_equal user, reply.user
  end

  test "belongs to a post" do
    topic = topics(:reply_topic)
    reply = replies(:belongs_test)

    assert_equal topic, reply.post
  end

  test "can belong to another reply" do
    belong = replies(:belongs_test)
    hasmany = replies(:hasmany_test)

    assert_equal belong, hasmany.post
  end

  test "can have many replies" do
    reply = replies(:belongs_test)

    assert_equal 1, reply.replies.length
  end

  test "can have many likes" do
    reply = replies(:hasmany_test)

    assert_equal 1, reply.likes.length
  end
end
