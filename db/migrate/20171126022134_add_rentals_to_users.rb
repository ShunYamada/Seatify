class AddRentalsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :iphone, :string
    add_column :users, :android, :sting
    add_column :users, :macbook, :string
  end
end
