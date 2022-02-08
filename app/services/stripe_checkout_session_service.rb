class StripeCheckoutSessionService
  def call(event)
    @booking = Booking.find_by(checkout_session_id: event.data.object.id)

    session = Stripe::Checkout::Session.retrieve(
      id: @booking.checkout_session_id,
      expand: ['setup_intent']
    )

    @booking.user.update(payment_method_id: session.setup_intent.payment_method)
    @booking.user.details_available!
    @booking.confirmed!
  end
end
