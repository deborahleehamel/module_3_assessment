class SearchController < ApplicationController

  def index
    @stores = NearestStore.all(params[:search])
  end
end
