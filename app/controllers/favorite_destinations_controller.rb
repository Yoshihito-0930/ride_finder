class FavoriteDestinationsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @destination = Destination.find(params[:destination_id])
    current_user.add_favorite(@destination)
  end

  def destroy
    @destination = current_user.favorites.find(params[:id])
    current_user.unfavorite(@destination)
  end
end
