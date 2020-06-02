require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "fixtures are functioning" do
    assert_equal 2, likes(:one, :two).length
  end

  test "correctly validates presence of user and post" do
    reply_one = replies(:one)
    user_one = users(:one)
    like = Like.new(post: reply_one, user: user_one)
    assert_silent do
      like.save
    end
  end

  test "validations fail without user or post" do
    like1 = Like.new
    assert_equal false, like1.save

    topic_one = topics(:one)
    like2 = Like.new(post: topic_one)
    assert_equal false, like2.save

    user_one = users(:one)
    like3 = Like.new(user: user_one)
    assert_equal false, like3.save
  end

  test "belongs to a user" do
    user = users(:like_user)
    like = likes(:belongs_test)
    assert_equal user, like.user
  end

  test "belongs to a post" do
    topic = topics(:like_topic)
    like = likes(:belongs_test)
    assert_equal topic, like.post
  end
end
