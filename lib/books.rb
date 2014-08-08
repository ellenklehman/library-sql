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

  def update(new_title)
    @title = new_title['title']
    DB.exec("UPDATE books SET title = '#{@title}';")
  end

  def authors
    authors = []
    results = DB.exec("select authors.* from
                       books join authors_and_book on (books.id = authors_and_book.books_id)
                       join authors on (authors_and_book.authors_id = authors.id)
                       where books.id = #{self.id}")
    results.each do |result|
      id = result['id'].to_i
      name = result['name']
      authors << Author.new({'name' => name, 'id' => id})
    end
    authors
  end

  def add_author(authors_id)
    DB.exec("INSERT INTO authors_and_book (authors_id, books_id) VALUES (#{authors_id}, #{self.id});")
  end
end
