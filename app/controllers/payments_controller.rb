class PaymentsController < ApplicationController
  def start
    @booking = Booking.find(params[:id])
    session_id = @booking.checkout_session_id
    session = Stripe::Checkout::Session.retrieve(
      id: session_id,
      expand: ['setup_intent']
    )
    payment_method_id = session.setup_intent.payment_method
    customer_id = session.customer
    amount = @booking.amount_cents
      if @booking.status == "accepted"
        payment = Stripe::PaymentIntent.create(
          customer: customer_id,
          payment_method: payment_method_id,
          amount: amount,
          currency: 'eur',
          confirm: true,
        )
        @booking.update(payment_id: payment.id)
        redirect_to camels_path
    else
      @booking.cancelled!
      redirect_to camels_path
    end
  end
end
