class Message < ApplicationRecord
  belongs_to :store

  validates presence: true
end
