class PaymentsController < ApplicationController
  def start
    @booking = Booking.find(params[:id])
    session_id = @booking.checkout_session_id
    session = Stripe::Checkout::Session.retrieve(
      id: session_id,
      expand: ['setup_intent']
    )
    if @booking.status == "Accepted"
    payment = Stripe::PaymentIntent.create(
      customer: customer_id,
      payment_method: payment_method_id,
      amount: amount,
      currency: 'eur',
      confirm: true,
    )
    @booking.paid!
    redirect_to camels_path
    else
      cancel = Stripe::SetupIntent.cancel(
       session_id,
      )
      @booking.cancelled!
      redirect_to camels_path
    end
  end
end
