class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :camel
end
