class BookForecast
  attr_reader :forecast, :books, :id, :destination

  def initialize(data, books, location)
    @id = nil
    @forecast = { summary: data[:summary], temperature: data[:temperature]}
    @books = books
    @destination = location
  end
end