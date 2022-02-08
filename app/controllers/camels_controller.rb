class CamelsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :policy_scope_camels, only: [:index, :show, :new]

  def index
    if params[:query].present?
      @camels = Camel.search_by_city(params[:query])
    else
      @camels = Camel.all
    end
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
    @camel = Camel.new(camel_params)
    @camel.user = current_user
    authorize @camel
    if @camel.save
      redirect_to camels_path
    else
      #raise
      render :new
    end
  end

  def camel_params
    params.require(:camel).permit(:name, :age, :description, :price, :city, :purpose, :photo)
  end

  def policy_scope_camels
    @camels = policy_scope(Camel)
  end
end
