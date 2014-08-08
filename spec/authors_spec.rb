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
end
