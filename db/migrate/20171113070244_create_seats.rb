class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
      t.string :name
      t.string :url
      t.string :address
      t.string :price
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :seats, [:user_id, :created_at]
  end
end
