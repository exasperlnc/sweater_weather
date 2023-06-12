require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns books for a location' do
    location = 'provo, ut'
    books = BookFacade.new.books(location)

    expect(books).to be_a Array
    expect(books.first).to be_a Book
  end
end