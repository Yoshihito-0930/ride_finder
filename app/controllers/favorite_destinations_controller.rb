class FavoriteDestinationsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    destination = Destination.find(params[:destination_id])
    current_user.favorite(destination)
    redirect_to destination_path(destination)
  end

  def destroy
    destination = current_user.destinations.find_by(id: params[:destination_id])
    current_user.unfavorite(destination)
    redirect_to destination_path(destination)
  end
end
