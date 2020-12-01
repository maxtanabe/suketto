class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  with_options presence: true do
    validates :title
    validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}
    validates_inclusion_of :price, in: 500..5000
    validates :video
  end
end
