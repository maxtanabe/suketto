class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, dependent: :destroy
  belongs_to :area
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :area, numericality: { other_than: 1 }
    validates :address
    validates :phone_number, format: { with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i } do
    validates :password
    validates :password_confirmation
  end
end
end