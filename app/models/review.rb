class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewed, class_name: "User"

  default_scope -> { order(created_at: :desc) }
end
