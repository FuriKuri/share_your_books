require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "should save user" do
    user = User.new
    user.name = 'hans'
    user.password = 'secret'
    assert user.valid?
  end

  test "should not save user with no name" do
    user = User.new
    user.password = 'secret'
    assert user.invalid?
  end

  test "should not save user with no password" do
    user = User.new
    user.name = 'hans'
    assert user.invalid?
  end

  test "should not save user with too short name" do
    user = User.new
    user.name = 'u'
    user.password = 'secret'
    assert user.invalid?
  end


  test "should not save user with too long name" do
    user = User.new
    name = ''
    41.times {name += 'u'}
    user.name = name
    user.password = 'secret'
    assert user.invalid?
  end

  test "should not save user with too short password" do
    user = User.new
    user.name = 'hans'
    user.password = 'pw'
    assert user.invalid?
  end

  test "should not save user with too long password" do
    user = User.new
    user.name = 'hans'
    pw = ''
    41.times {pw += 'p'}
    user.password = pw
    assert user.invalid?
  end

  test "should not save user with an existing name" do
    user = User.new
    user.name = 'dave'
    user.password = 'secret'
    assert user.invalid?
  end
end
