class AddMapsToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :latitude, :float
    add_column :seats, :longitude, :float
  end
end
