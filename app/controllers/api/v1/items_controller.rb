class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    render json: Item.all
  end

  def show
   render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.destroy(params[:id])
  end

  def create
    render json: Item.create(item_params), status: 201
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end

end
