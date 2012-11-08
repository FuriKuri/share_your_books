require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:clean_code)
    login_as(:dave)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { description: @book.description, image_url: @book.image_url, lent_to_user_id: @book.lent_to_user_id, owner_id: @book.owner_id, title: @book.title }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    put :update, id: @book, book: { description: @book.description, image_url: @book.image_url, lent_to_user_id: @book.lent_to_user_id, owner_id: @book.owner_id, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
