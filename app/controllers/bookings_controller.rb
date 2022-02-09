class BookingsController < ApplicationController
  before_action :find_camel, except: [:edit, :update, :index]

  def new
    @booking = Booking.new
    @camels = policy_scope(Camel)
    authorize @booking
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.camel = @camel
    @booking.user = current_user
    time = (@booking.check_out - @booking.check_in).to_i
    @booking.amount = @camel.price_cents * time
    authorize @booking

    if @booking.save
      @booking.pending!
      redirect_to checkout_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @camels = policy_scope(Camel)
  end

  def update
    @booking = Booking.find(params[:id])
    if params["booking"]["status"] == "Accept"
      @booking.accepted!
      redirect_to payment_path(@booking)
    elsif params["booking"]["status"] == "Decline"
      @booking.declined!
      redirect_to payment_path(@booking)
    end
    authorize @booking
  end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @booking.update(request_params)
  #   authorize @booking
  # end

  def index
    @bookings = policy_scope(Booking)
    @camels = policy_scope(Camel)
  end

  private

  def find_camel
    @camel = Camel.find(params[:camel_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

  # def request_params
  #   params.require(:booking).permit(:status)
  # end
end
