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

  test "should not save user with too short password" do
    user = User.new
    user.name = 'hans'
    user.password = 'pw'
    user.email = 'user@email.com'
    assert !user.save
  end

  test "should not save user with too long password" do
    user = User.new
    user.name = 'hans'
    pw = ''
    41.times {pw += 'p'}
    user.password = pw
    user.email = 'user@email.com'
    assert !user.save
  end

  test "should not save user with a wrong email format" do
    user = User.new
    user.name = 'hans'
    user.password = 'secret'
    user.email = 'email.com'
    assert !user.save
  end

  test "should not save user with an existing name" do
    user = User.new
    user.name = 'user1'
    user.password = 'secret'
    user.email = 'user@email.com'
    assert !user.save
  end

  test "should not save user with an existing email" do
    user = User.new
    user.name = 'hans'
    user.password = 'secret'
    user.email = 'user1@email.com'
    assert !user.save
  end

  # test "the truth" do
  #   assert true
  # end
end
