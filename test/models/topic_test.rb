require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "saves valid objects" do
    user = users(:one)
    topic = Topic.new(user: user, content: "Hello World", title: "A Test!")
    assert_equal true, topic.save
  end

  test "Does not save invalid objects" do
    topic1 = Topic.new
    assert_equal false, topic1.save

    topic2 = Topic.new(title: "A Test!", content: "Hello World")
    assert_equal false, topic2.save

    user = users(:one)
    topic3 = Topic.new(title: "A Test", user: user)
    assert_equal false, topic3.save
  end

  test "Belongs to a user" do
    user = users(:topic_user)
    topic = topics(:associations)
    assert_equal user, topic.user
  end

  test "has many replies" do
    topic = topics(:associations)
    assert_equal 1, topic.replies.length
  end

  test "has many likes" do
    topic = topics(:associations)
    assert_equal 1, topic.likes.length
  end
end
