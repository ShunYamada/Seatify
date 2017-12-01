class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewed, class_name: "User", foreign_key: :reviewed_id

  default_scope -> { order(created_at: :desc) }
end
