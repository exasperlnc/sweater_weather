class BookFacade

  def books(location)
    data = service.get_books(location)
    data[:docs].map do |book_data|
      Book.new(book_data)
    end
  end


  private 
    def service
      @_service = BookService.new
    end
end