class User < ApplicationRecord

  has_one :store, dependent: :destroy
  has_many :messages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  # Actions for Store on user creation / update
  after_create :generate_empty_store
  after_update :update_store_slug

  private

    def generate_empty_store
      Store.create!(user_id: self.id, slug: self.username.parameterize)
    end

    def update_store_slug
      self.store.update(slug: self.username.parameterize)
    end

end
