class Camel < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, :age, :description, :price, :city, :purpose, presence: true
end
