class Product < ApplicationRecord
  belongs_to :store
  validates :price, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
