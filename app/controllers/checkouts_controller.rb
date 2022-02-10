class CheckoutsController < ApplicationController
  def start
    @booking = Booking.find(params[:id])
    if @booking.user.payment_information == "details_available"
      @booking.confirmed!
      redirect_to success_path
    elsif @booking.user.payment_information == "pending"
      @session = create_checkout(@booking.user.payment_customer_id)
      @booking.update(checkout_session_id: @session.id)
      redirect_to @session.url
    else
      customer = Stripe::Customer.create
      @session = create_checkout(customer.id)
      @booking.update(checkout_session_id: @session.id)
      @booking.user.update(payment_customer_id: customer.id)
      @booking.user.pending!
      redirect_to @session.url
    end
  end

  def success
  end

  private

  def create_checkout(customer_id)
    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      mode: 'setup',
      success_url: "#{root_url}checkout/success",
      cancel_url: "#{root_url}camels",
      customer: customer_id
    )
  end
end
