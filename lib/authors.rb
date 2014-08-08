class Author
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def Author.all
    authors =[]
    results = DB.exec("SELECT * FROM authors;")
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      authors <<Author.new({'name' => name, 'id' => id})
    end
    authors
  end

  def save
    result = DB.exec("INSERT INTO authors (name, id) VALUES ('#{@name}', #{@id}) RETURNING id;")
    @id = result.first['id'].to_i
  end

  def ==(another_book)
    self.name == another_book.name
  end

  def delete
    DB.exec("DELETE FROM authors WHERE id = #{self.id};")
  end

  def update(new_name)
    @name = new_name['name']
    DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = #{self.id};")
  end

  def books
    books = []
    results = DB.exec("select books.* from
                       authors join authors_and_book on (authors.id = authors_and_book.authors_id)
                       join books on (authors_and_book.books_id = books.id)
                       where authors.id = #{self.id}")
    results.each do |result|
      id = result['id'].to_i
      title = result['title']
      books << Book.new({'title' => title, 'id' => id})
    end
    books
  end

  def add_book(books_id)
    DB.exec("INSERT INTO authors_and_book (authors_id, books_id) VALUES (#{self.id}, #{books_id});")
  end
end
