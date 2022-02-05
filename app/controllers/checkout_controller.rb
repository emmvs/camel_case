class CheckoutController < ApplicationController
  def create
    @booking = Booking.find(params[:id])
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @booking.camel.name,
      amount: @booking.camel.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    mode: 'setup',
    success_url: root_url,
    cancel_url: root_url
  )
  respond_to do |format|
    format.js
  end

  @booking.update(checkout_session_id: @session.id)
  end
end
