class CheckoutsController < ApplicationController
  def start
    @booking = Booking.find(params[:id])
    customer = Stripe::Customer.create
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    # line_items: [{
    #   name: @booking.camel.name,
    #   amount: @booking.camel.price_cents,
    #   currency: 'eur',
    #   quantity: 1
    # }],
    mode: 'setup',
    success_url: "#{root_url}camels",
    cancel_url: "#{root_url}camels",
    customer: customer.id
  )

  @booking.update(checkout_session_id: @session.id)
  redirect_to @session.url
  end
end
