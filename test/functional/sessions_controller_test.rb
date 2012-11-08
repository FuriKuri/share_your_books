require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login with an user" do
    post :create, :name => 'dave', :password => 'secret'
    assert_redirected_to books_url
    assert_not_nil session[:user_id]
  end

  test "should not login with an incorrect user" do
    post :create, :name => 'dave', :password => 'wrong'
    assert_redirected_to login_url
  end

  test "should log out" do
    login_as(:dave)
    delete :destroy
    assert_nil session[:user_id]
  end
end
