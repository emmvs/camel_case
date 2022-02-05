class BookingsController < ApplicationController
  before_action :find_camel, except: [:edit, :update, :index]

  def new
    @bookings = policy_scope(Booking)
    @booking = Booking.new
    authorize @booking
  end

  def create
    @bookings = policy_scope(Booking)
    @booking = Booking.new(booking_params)
    @booking.camel = @camel
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to camel_path(@camel)
    else
      render :new
    end
  end

  def edit
    @bookings = policy_scope(Booking)
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @bookings = policy_scope(Booking)
    @booking = Booking.find(params[:id])
    @booking.update(request_params)
    authorize @booking
  end

  def index
    @bookings = policy_scope(Booking)
  end


  private

  def find_camel
    @camel = Camel.find(params[:camel_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

  def request_params
    params.require(:booking).permit(:status)
  end
end
