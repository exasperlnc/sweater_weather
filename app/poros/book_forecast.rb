class BookForecast
  attr_reader :summary, :temperature, :books, :id

  def initialize(data, books)
    @id = nil
    @summary = data[:summary]
    @temperature = data[:temperature]
    @books = books
  end
end