class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user
  has_many :messages, dependent: :destroy
  extend FriendlyId
  friendly_id :name

  ratyrate_rateable "quality"

  validates :name, presence: true, uniqueness: { message: "Username already in use" }
end
