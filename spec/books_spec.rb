require 'spec_helper'

describe 'Book' do
  it 'is initialized with a name and an id' do
    new_book = Book.new({'name' => 'To The Lighthouse', 'id' => 1})
    expect(new_book).to be_an_instance_of Book
  end
end
