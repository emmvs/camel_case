class CamelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :policy_scope_camels, only: [:index, :show, :new]

  def index
  end

  def show
    @camel = Camel.find(params[:id])
    authorize @camel
  end

  def new
    @camel = Camel.new
    authorize @camel
  end

  def create
    @camel = camel.new(camel_params)
    authorize @camel
    if @camel.save
      redirect_to camels_path
    else
      render :new
    end
  end

  def camel_params
    params.require(:camel).permit(:name, :age, :description, :price, :city, :purpose)
  end

  def policy_scope_camels
    @camels = policy_scope(Camel)
  end
end
