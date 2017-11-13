class AddUtilitiesToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :wifi, :string
    add_column :seats, :charge, :string
  end
end
