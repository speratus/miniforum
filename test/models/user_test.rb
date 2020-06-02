require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Saves valid objects" do
    user = User.new(
      username: "jon",
      name: "Jon doe",
      email: "hello@world.com",
      password: "nobody knows"
    )

    assert_equal true, user.save
  end

  test "Will not save a user missing an attribute" do
    user = User.new(
      username: 'jon',
      email: 'hello@world.com',
      password: 'nobody knows'
    )
    assert_equal false, user.save
  end

  test "will not save a user with an invalid username" do
    user = User.new(
      username: 'jon++++. cool',
      name: 'jon doe',
      email: 'hello@world.com',
      password: 'nobody knows'
    )
    assert_equal false, user.save
  end

  test "will not save a user with an invalid email address" do
    user = User.new(
      username: 'jon',
      name: 'jon doe',
      email: 'hello@world@universe.co',
      password: 'nobody knows'
    )
    assert_equal false, user.save
  end

  test "email must be unique" do
    user = User.new(
      username: 'jon',
      name: 'jon doe',
      email: 'MyString',
      password: 'nobody knows'
    )
    assert_equal false, user.save
  end

  test "has many topics" do
    user = users(:topic_user)
    assert_equal 1, user.topics.length
  end

  test "has many comments" do
    user = users(:topic_user)
    assert_equal 1, user.comments.length
  end

  test "has many likes" do
    user = users(:topic_user)
    assert_equal 1, user.likes.length
  end
end
