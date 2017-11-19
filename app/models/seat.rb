class Seat < ApplicationRecord
  belongs_to :user, optional: true
  accepts_nested_attributes_for :user
  validates :user_id, presence: true
  mount_uploader :image, ImagesUploader

  default_scope -> { order(created_at: :desc) }
end
