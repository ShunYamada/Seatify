class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sms, :string
    add_column :users, :occupation, :string
    add_column :users, :description, :text
  end
end
