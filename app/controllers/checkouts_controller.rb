class CheckoutsController < ApplicationController
  def start
    @booking = Booking.find(params[:id])
    if @booking.user.payment_information == "details_available"
      @booking.confirmed!
      redirect_to camels_path
    elsif @booking.user.payment_information == "pending"
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        mode: 'setup',
        success_url: "#{root_url}camels",
        cancel_url: "#{root_url}camels",
        customer: @booking.user.payment_customer_id
      )
      @booking.update(checkout_session_id: @session.id)
      redirect_to @session.url
    else
      customer = Stripe::Customer.create
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        mode: 'setup',
        success_url: "#{root_url}camels",
        cancel_url: "#{root_url}camels",
        customer: customer.id
      )
      @booking.update(checkout_session_id: @session.id)
      @booking.user.update(payment_customer_id: customer.id)
      @booking.user.pending!
      redirect_to @session.url
    end
  end
end
