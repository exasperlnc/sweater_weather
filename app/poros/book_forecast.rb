class BookForecast
  attr_reader :forecast, :books, :id, :destination, :total_books_found

  def initialize(data, books, location)
    @id = nil
    @forecast = { summary: data[:summary], temperature: data[:temperature]}
    @books = books
    @destination = location
    @total_books_found = books.count
  end
end