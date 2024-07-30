class DestinationsController < ApplicationController

  def create
    place_data = JSON.parse(params[:place_data])

    @destination = Destination.find_or_create_from_place_data(place_data)
    if @destination.save
      redirect_to destination_path(@destination, place_id: @destination.google_maps_place_id)
    else
      flash.now[:alert] = "目的地の取得に失敗しました。"
      render searchs_result_path
    end
  end

  def show
    @destination = Destination.find_by(google_maps_place_id: params[:place_id])
  end

  def favorite_destinations
    @favorite_destinations = Destination.find_by(id: params[:id])
  end


  private

end
