class AddImageToSeat < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :image, :string
  end
end
