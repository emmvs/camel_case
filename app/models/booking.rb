class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camel
  validates :check_in, :check_out, presence: true
  validate :check_out_after_check_in

  enum status: { draft: 0, pending: 1, confirmed: 2, declined: 3, accepted: 4, cancelled: 5, paid: 6 }

  monetize :amount_cents

  private

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?

    if check_out < check_in
      errors.add(:check_out, "must be after the start date")
    end
  end
end
