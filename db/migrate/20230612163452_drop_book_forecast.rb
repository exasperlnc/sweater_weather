class DropBookForecast < ActiveRecord::Migration[7.0]
  def change
    drop_table :book_forecasts
  end
end
