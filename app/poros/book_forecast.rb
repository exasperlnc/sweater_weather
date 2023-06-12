class BookForecast
  attr_reader :summary, :temperature, :books, :id, :destination

  def initialize(data, books, location)
    @id = nil
    @summary = data[:summary]
    @temperature = data[:temperature]
    @books = books
    @destination = location
  end
end