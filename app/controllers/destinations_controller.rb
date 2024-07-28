class DestinationsController < ApplicationController

  def create
    place_data = JSON.parse(params[:place_data])

    #複数のユーザーが同時に同じplaceで実行されるとデータが競合状態になる可能性もあるからfind_or_create_by! メソッドを使用するか、トランザクションを使用することを検討
    @destination = Destination.find_or_create_by(google_maps_place_id: place_data['place_id']) do |destination|
  
      destination.name = place_data['name']
      destination.address = place_data['formatted_address']
      destination.latitude = place_data['geometry']['location']['lat']
      destination.longitude = place_data['geometry']['location']['lng']
      destination.rating = place_data['rating']
  
      destination.image = place_data['photo_url'] if place_data['photo_url'].present?
  
      if place_data['opening_hours'] && place_data['opening_hours']['weekday_text']
        destination.business_hours = place_data['opening_hours']['weekday_text'].join("\n")
      end
  
      destination.user_ratings_total = place_data['user_ratings_total']
    end
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


  private

end
