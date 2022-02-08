class PaymentsController < ApplicationController
  def start
    @booking = Booking.find(params[:id])
    amount = @booking.amount_cents
    if @booking.status == "accepted"
      payment = Stripe::PaymentIntent.create(
        customer: @booking.user.payment_customer_id,
        payment_method: @booking.user.payment_method_id,
        amount: amount,
        currency: 'eur',
        confirm: true
      )
      @booking.update(payment_id: payment.id)
    else
      @booking.cancelled!
    end
    redirect_to camels_path
  end
end
