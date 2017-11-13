class Seat < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :image, ImagesUploader
end
