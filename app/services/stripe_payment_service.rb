class StripePaymentService
  def call(event)
    @booking = Booking.find_by(payment_id: event.data.object.id)
    @booking.paid!
  end
end
