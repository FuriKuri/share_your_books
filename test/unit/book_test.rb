require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should save book" do
    book = Book.new
    book.title = 'Clean Code'
    book.image_url = 'cleancode.jpg'
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.valid?
  end

  test "should not save book with no title" do
    book = Book.new
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.invalid?
  end

  test "should not save book with no description" do
    book = Book.new
    book.title = 'Clean Code'
    assert book.invalid?
  end

  test "should not save book with invalid image url" do
    book = Book.new
    book.title = 'Clean Code'
    book.image_url = 'wrong_image'
    book.description = 'Clean Code book form Robert C. Martin'
    assert book.invalid?
  end
end
