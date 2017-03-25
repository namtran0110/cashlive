class Product < ApplicationRecord
  belongs_to :store
  validates :price, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :avatar, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :avatar

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
