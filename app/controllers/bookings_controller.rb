class BookingsController < ApplicationController
  before_action :find_camel

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
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

  private

  def find_camel
    @camel = Camel.find(params[:camel_id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
