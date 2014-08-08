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
    DB.exec("INSERT INTO authors (name, id) VALUES ('#{@name}', '#{@id}')")
  end

  def ==(another_book)
    self.name == another_book.name
  end
end
