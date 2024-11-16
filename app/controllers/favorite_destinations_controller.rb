class FavoriteDestinationsController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    destination = Destination.find(params[:destination_id])
    current_user.add_favorite(destination)
    flash[:success] = 'お気に入りに追加しました'
    redirect_to destination_path(destination)
  end

  def destroy
    destination = current_user.favorites.find(params[:destination_id])
    current_user.unfavorite(destination)
    flash[:info] = 'お気に入りから削除しました'
    redirect_to destination_path(destination)
  end
end
