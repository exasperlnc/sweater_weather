class BookForecast
  attr_reader :summary, :temperature, :books, :id, :location

  def initialize(data, books, location)
    @id = nil
    @summary = data[:summary]
    @temperature = data[:temperature]
    @books = books
    @location = location
  end
end