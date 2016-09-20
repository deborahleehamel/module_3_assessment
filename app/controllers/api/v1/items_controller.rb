class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    render json: Item.all
  end
end
