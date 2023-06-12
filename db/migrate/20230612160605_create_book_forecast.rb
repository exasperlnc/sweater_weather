class CreateBookForecast < ActiveRecord::Migration[7.0]
  def change
    create_table :book_forecasts do |t|
      t.string :summary
      t.float :temperature
      t.integer :total_books_found
      t.string :isbn
      t.string :destinaion
      t.string :title
      t.string :publisher

      t.timestamps
    end
  end
end
