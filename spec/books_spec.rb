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

  it 'updates book information' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    new_book.save
    new_book.update({'title' => 'Mrs. Dalloway'})
    expect(new_book.title).to eq 'Mrs. Dalloway'
  end

  it 'attributes an author to a book' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    new_book.save
    new_author = Author.new({'name' => 'Virginia Woolf', 'id' => 1})
    new_author.save
    new_book.add_author(new_author.id)
    expect(new_book.authors).to eq [new_author]
  end

  it 'begins with an empty array to store all of the authors' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    new_book.save
    expect(new_book.authors).to eq []
  end
end
