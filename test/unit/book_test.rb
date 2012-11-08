require 'test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :books

  test "should save book" do
    book = Book.new
    book.title = 'Clean Code'
    book.owner_id = users(:dave).id
    book.lent_to_user_id = users(:tom).id
    book.image_url = 'cleancode.jpg'
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.valid?
  end

  test "should not save book with no title" do
    book = Book.new
    book.description = 'Clean Code book form Robert C. Martin'
    book.owner_id = users(:dave).id
    book.lent_to_user_id = users(:tom).id
    book.image_url = 'cleancode.jpg'
    assert book.invalid?
  end

  test "should not save book with no description" do
    book = Book.new
    book.title = 'Clean Code'
    book.owner_id = users(:dave).id
    book.lent_to_user_id = users(:tom).id
    book.image_url = 'cleancode.jpg'
    assert book.invalid?
  end

  test "should not save book with invalid image url" do
    book = Book.new
    book.title = 'Clean Code'
    book.image_url = 'wrong_image'
    book.lent_to_user_id = users(:tom).id
    book.owner_id = users(:dave).id
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.invalid?
  end

  test "set default value for image url" do
    book = Book.new
    book.title = 'Clean Code'
    book.lent_to_user_id = users(:tom).id
    book.owner_id = users(:dave).id
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.valid?
    assert_equal('no_image.png', book.image_url)
  end

  test "should not save book without owner" do
    book = Book.new
    book.title = 'Clean Code'
    book.lent_to_user_id = users(:tom).id
    book.image_url = 'cleancode.jpg'
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.invalid?
  end

  test "should not save book without lent to user" do
    book = Book.new
    book.title = 'Clean Code'
    book.owner_id = users(:dave).id
    book.image_url = 'cleancode.jpg'
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.invalid?
  end
end
