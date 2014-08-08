require 'rspec'
require 'authors'
require 'books'
require 'pg'

DB = PG.connect({:dbname => 'library_database'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors *;")
  end
end
