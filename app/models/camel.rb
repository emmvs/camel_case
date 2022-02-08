class Camel < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, :age, :description, :price, :city, :purpose, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city, :purpose, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  monetize :price_cents
end
