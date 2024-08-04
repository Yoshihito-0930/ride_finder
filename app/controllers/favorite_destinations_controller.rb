class FavoriteDestinationsController < ApplicationController
  before_action :require_login, only: %i[create destroy]
  def create
    destination = Destination.find(params[:destination_id])
    current_user.favorite(destination)
    redirect_to favorites_destinations_path
  end

  def destroy
    destination = current_user.favorite.find(params[:id]).destination
    current_user.unfavorite(destination)
    redirect_to favorite_destinations_path, status: :see_other
  end
end
