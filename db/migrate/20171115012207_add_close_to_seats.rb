class AddCloseToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :close, :boolean, default: false, null: false 
  end
end
