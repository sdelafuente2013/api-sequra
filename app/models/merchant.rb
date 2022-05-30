class Merchant < ApplicationRecord
  has_many :orders

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
