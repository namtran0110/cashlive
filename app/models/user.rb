class User < ApplicationRecord

  has_one :store, dependent: :destroy
  has_many :messages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :omniauth_providers => [:facebook]

  # Config paperclip
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # Config subscribe
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  # Config ratyrate for rating
  ratyrate_rater

  # Actions
  after_create :generate_empty_store
  after_update :update_store_slug

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  private

    def generate_empty_store
      store = Store.create!(user_id: self.id, name: self.username)
      StreamInstance.create!(store_id: store.id)
    end

    def update_store_slug
      self.store.update(name: self.username)
    end
end
