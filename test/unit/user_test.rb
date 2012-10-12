require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "should save user" do
    user = User.new
    user.name = 'hans'
    user.password = 'secret'
    user.email = 'hans@email.com'
    assert user.save
  end

  test "should not save user with no name" do
    user = User.new
    user.password = 'secret'
    user.email = 'user@email.com'
    assert !user.save
  end

  test "should not save user with no password" do
    user = User.new
    user.name = 'hans'
    user.email = 'user@email.com'
    assert !user.save
  end

  test "should not save user with no email" do
    user = User.new
    user.name = 'hans'
    user.password = 'secret'
    assert !user.save
  end

  test "should not save user with too short name" do
    user = User.new
    user.name = 'u'
    user.password = 'secret'
    user.email = 'user@email.com'
    assert !user.save
  end


  test "should not save user with too long name" do
    user = User.new
    name = ''
    41.times {name += 'u'}
    user.name = name
    user.password = 'secret'
    user.email = 'user@email.com'
    assert !user.save
  end

  # test "the truth" do
  #   assert true
  # end
end
