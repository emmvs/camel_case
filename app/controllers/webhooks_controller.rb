class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
    begin
        event = Stripe::Webhook.construct_event(
            payload, sig_header, ENV['STRIPE_WEBHOOK_SECRET_KEY']
        )
    rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return
    rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        status 400
        return
    end
    binding.pry
    case event.type
    when 'checkout.session.completed'
        @session = event.data.object
        @booking = Booking.find_by(checkout_session_id: @session.id)
        binding.pry
        @booking.confirmed!
        @booking.save
    else
        puts "Unhandled event type: #{event.type}"
    end
    status 200
  end
  end
