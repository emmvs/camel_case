class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      user.bookings_as_owner
    end
  end

  def create?
    true
  end

  def update?
    record.user == user
  end
end
