require 'spec_helper'

describe 'Book' do
  it 'is initialized with a title and an id' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    expect(new_book).to be_an_instance_of Book
  end

  it 'has an empty array to store all books' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    expect(Book.all).to eq []
  end

  it 'saves all instances of book to the array' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    new_book.save
    expect(Book.all).to eq [new_book]
  end

   it 'deletes books from the array of books' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    new_book.save
    new_book.delete
    expect(Book.all).to eq []
  end
end
