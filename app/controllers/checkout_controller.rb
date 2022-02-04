class CheckoutController < ApplicationController
  def create
    camel = Camel.find(params[:camel_id])
    @session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: camel.sku,
      amount: camel.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    mode: 'setup',
    success_url: root_url,
    cancel_url: root_url,
  )
  respond_to do |format|
    format.js
  end
  end
end
