require 'rails_helper'

RSpec.describe BookService do
  it 'gets books for a location' do
    location = 'provo, ut'
    service = BookService.new
    books = service.get_books(location)

    expect(books).to be_a Hash
    expect(books[:num_found]).to be_a Integer
    expect(books[:num_found]).to eq(books[:docs].count)

      expect(books[:docs].first[:isbn]).to be_a Array
      expect(books[:docs].first[:title]).to be_a String
      expect(books[:docs].first[:publisher]).to be_a Array
  end
end