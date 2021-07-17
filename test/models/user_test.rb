# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name_or_email" do
    @user = users(:nameless)
    assert_equal 'nameless@example.com', @user.name_or_email

    @user.name = 'Foo Bar'
    assert_equal 'Foo Bar', @user.name_or_email
  end

  test '#follow' do
    @alice = users(:Alice)
    @bob = users(:Bob)

    assert_not @alice.following?(@bob)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
  end

  test '#unfollow' do
  @alice = users(:Alice)
  @bob = users(:Bob)

  @alice.follow(@bob)
  assert @alice.following?(@bob)
  @alice.unfollow(@bob)
  assert_not @alice.following?(@bob)
  end

  test '#following?' do
  @alice = users(:Alice)
  @bob = users(:Bob)
  
  assert_not @alice.following?(@bob)
  Relationship.create!(following_id: @bob.id, follower_id: @alice.id)
  assert @alice.following?(@bob)
  end

  test '#followed_by' do
  @alice = users(:Alice)
  @bob = users(:Bob)

  assert_not @alice.followed_by?(@bob)
  Relationship.create!(following_id: @alice.id, follower_id: @bob.id)
  assert @alice.followed_by?(@bob)
  end
end
