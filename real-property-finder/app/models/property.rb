class Property < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :account

  has_many :favorites, dependent: :destroy
  # has_many :favorited_by, through: :favorites, source: :account
  has_many :accounts, through: :favorites

  scope :latest, -> {order created_at: :desc}

  has_many_attached :images



end
