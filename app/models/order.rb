class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  validates :week, :amount, presence: true
end
