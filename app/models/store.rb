class Store < ApplicationRecord
  belongs_to :user

  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: { message: "Username already in use" }
end
