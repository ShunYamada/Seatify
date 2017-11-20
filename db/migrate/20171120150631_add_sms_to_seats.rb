class AddSmsToSeats < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :sms, :string
  end
end
