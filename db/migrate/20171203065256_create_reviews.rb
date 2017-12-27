class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :content
      t.references :reviewer, foreign_key: true, references: :users
      t.references :reviewed, foreign_key: true, references: :users

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at]
    add_index :reviews, [:reviewed_id, :created_at]
  end
end
