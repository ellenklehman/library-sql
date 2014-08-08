class Book
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes['title']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM books;")
    books = []
    results.each do |result|
      title = result['title']
      id = result['id'].to_i
      books << Book.new({'title' => title, 'id' => id})
    end
    books
  end

  def save
    results = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_book)
    self.title == another_book.title
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{self.id};")
  end
end
