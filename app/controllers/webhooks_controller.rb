class WebhooksController < ApplicationController

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

    case event.type
    when 'setup_intent.succeeded'
        setup_intent = event.data.object
        @booking = Booking.find_by(checkout_session_id: session.id)
        @booking.confirmed!
    else
        puts "Unhandled event type: #{event.type}"
    end
    status 200
  end
