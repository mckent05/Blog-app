class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, class_name: 'Post', foreign_key: 'users_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'users_id', dependent: :destroy
  has_many :comments, class_name: 'Comment', foreign_key: 'users_id', dependent: :destroy

  validates :name, presence: true
  # validates :postscounter, numericality: { greater_than_or_equal_to: 0 }

  after_create :generate_api_token

  def recent3_posts
    posts.last(3)
  end

  private

  def generate_api_token
    self.api_token = Devise.friendly_token
    save
  end
end
