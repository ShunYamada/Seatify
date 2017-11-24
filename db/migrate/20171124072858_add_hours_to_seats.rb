class AddHoursToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :hour, :string
  end
end
