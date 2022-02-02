class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camel
  validates :check_in, :check_out, presence: true
end
