class Card < ApplicationRecord
  belongs_to :user
  # with_options presence: true do
  #   validates :number
  #   validates :exp_year
  #   validates :exp_month
  # end
  #   validates :cvc, numericality: true
end
