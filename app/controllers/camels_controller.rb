class CamelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def home
  end

  def show
    @camel = Camel.find(params[:id])
  end

  def new
    @camel = Camel.new
  end

  def create
    @camel = camel.new(camel_params)
    if @camel.save
      redirect_to camels_path
    else
      render :new
    end
  end

  def camel_params
    params.require(:camel).permit(:name, :age, :description, :price, :city, :purpose)
  end
end
