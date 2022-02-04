class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camel
  validates :check_in, :check_out, presence: true

  enum status: { pending: 0, confirmed: 1, declined: 2, accepted: 3, cancelled: 4, paid: 5 }

  monetize :amount_cents
end
