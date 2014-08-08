class Book
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes['title']
    @id = attributes['id']
  end

  def self.all
    []
  end
end
