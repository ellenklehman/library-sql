require 'spec_helper'

describe 'Author' do
  it 'is initialized with a name and an id' do
    new_author = Author.new({'name' => 'Socrates', 'id' => 2})
    expect(new_author).to be_an_instance_of Author
  end

  it 'has an empty array to store all authors' do
    new_author = Author.new({'name' => 'Socrates', 'id' => 2})
    expect(Author.all).to eq []
  end

  it 'saves authors to the authors array' do
    new_author = Author.new({'name' => 'Socrates', 'id' => 2})
    new_author.save
    expect(Author.all).to eq [new_author]
  end

  it 'is the same if the author name is the same' do
    new_author = Author.new({'name' => 'Socrates', 'id' => 2})
    new_author.save
    new_author_two = Author.new({'name' => 'Socrates', 'id' => 3})
    expect(new_author).to eq new_author_two
  end

  it 'deletes authors from the authors array' do
    new_author = Author.new({'name' => 'Socrates', 'id' => 2})
    new_author.save
    new_author.delete
    expect(Author.all).to eq []
  end

  it 'updates an authors information' do
    new_author = Author.new({'name' => 'Socrates', 'id' => 2})
    new_author.save
    new_author.update({'name' => 'Aristotle'})
    expect(new_author.name).to eq 'Aristotle'
  end

  it 'attributes an book to a author' do
    new_book = Book.new({'title' => 'To The Lighthouse', 'id' => 1})
    new_book.save
    new_author = Author.new({'name' => 'Virginia Woolf', 'id' => 1})
    new_author.save
    new_author.add_book(new_book.id)
    expect(new_author.books).to eq [new_book]
  end

  it 'begins with an empty array to store all of the books' do
    new_author = Author.new({'name' => 'Virginia Woolf', 'id' => 1})
    new_author.save
    expect(new_author.books).to eq []
  end
end
