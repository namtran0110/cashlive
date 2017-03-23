class Store < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :products, dependent: :destroy
  validates :slug, presence: true, uniqueness: { message: "Username already in use" }
end
