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
end
