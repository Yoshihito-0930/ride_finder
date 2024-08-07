class DestinationsController < ApplicationController
  before_action :require_login, only: %i[favorites]

  def create
    place_data = JSON.parse(params[:place_data])

    @destination = Destination.find_or_create_from_place_data(place_data)
    if @destination.present?
      redirect_to destination_path(@destination)
    else
      flash.now[:alert] = "目的地の取得に失敗しました。ページをリロードしてから再度お試し下さい。"
      redirect_to :search_results
    end
  end

  def show
    @destination = Destination.find(params[:id])
  end

  def favorites
    @favorite_destinations = current_user.favorites.includes(:favorite_destinations).order(created_at: :desc)
  end

  def future_visits
    @future_visit_destinations = current_user.upcoming_destinations.includes(:future_visits).order(created_at: :desc)
  end

  private

end
