class Seat < ApplicationRecord
  include ActiveModel::Model
  include ActiveModel::Conversion

  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :image, ImagesUploader

  default_scope -> { order(created_at: :desc) }

  def persisted? ; false ; end
end
