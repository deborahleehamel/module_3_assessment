class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    render json: Item.all
  end

  def show
   render json: Item.find(params[:id])
 end

end
