class AddCommentToSeat < ActiveRecord::Migration[5.1]
  def change
    add_column :seats, :comment, :text
  end
end
