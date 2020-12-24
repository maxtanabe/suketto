class Thank < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :image
  end

end
