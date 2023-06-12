class BookService

  def get_books(location)
    get_url("?q=#{location}")
  end

  private

    def conn
      faraday = Faraday.new(url: "https://openlibrary.org/search.json") do |f|
      end
    end

    def get_url(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end