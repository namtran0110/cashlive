class Store < ApplicationRecord
  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :stream_instance

  extend FriendlyId
  friendly_id :name, use: :slugged

  ratyrate_rateable "quality"

  validates :name, presence: true, uniqueness: { message: "Username already in use" }
  validates :slug, presence: true, uniqueness: { message: "Username already in use" }

end
