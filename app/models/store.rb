class Store < ApplicationRecord
  belongs_to :user

  validates :slug, presence: true, uniqueness: { message: "Username already in use" }

end
