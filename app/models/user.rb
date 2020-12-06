class User < ApplicationRecord
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i } do
    validates :password
    validates :password_confirmation
  end
end
end