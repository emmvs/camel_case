class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camel
  validates :check_in, :check_out, presence: true

  enum status: { draft: 0, pending: 1, confirmed: 2, declined: 3, accepted: 4, cancelled: 5, paid: 6 }

  monetize :amount_cents
end
