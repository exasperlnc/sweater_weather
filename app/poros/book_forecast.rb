class BookForecast
  attr_reader :forecast, :books, :id, :destination, :total_books_found

  def initialize(data, books, location, books_needed)
    @id = nil
    @forecast = { summary: data[:summary], temperature: data[:temperature]}
    @books = []
    @destination = location
    @total_books_found = books.count
    @all_books = books
    @all_books[0..(books_needed.to_i)-1].each do |book|
      @books << book
    end
  end
end