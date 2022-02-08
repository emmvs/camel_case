class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :camels, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :first_name, :last_name, :phone_number, presence: true

  enum payment_information: { no_details: 0, pending: 1, details_available: 2 }
end
