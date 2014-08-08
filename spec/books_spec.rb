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
end
