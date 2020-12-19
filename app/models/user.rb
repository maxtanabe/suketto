class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  attr_accessor :current_password
  has_many :posts
  has_many :thanks
  has_many :comments, dependent: :destroy
  belongs_to :area
  has_one :card, dependent: :destroy
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :area_id, numericality: { other_than: 0 }
    validates :address
    validates :phone_number, format: { with: /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i } do
    validates :password, presence: true, on: :create
    validates :password_confirmation, presence: true, on: :create
  end
end
end
