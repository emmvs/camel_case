class Camel < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, :age, :description, :price, :city, :purpose, :camel_type, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city, :purpose, :description, :camel_type ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  monetize :price_cents

  def unavailable_dates
    bookings.pluck(:check_in, :check_out).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
