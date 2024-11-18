class DestinationsController < ApplicationController
  before_action :require_login, only: %i[favorites]
  require 'open-uri'
  require 'base64'

  def create
    place_data = JSON.parse(params[:place_data])

    @destination = Destination.find_or_create_from_place_data(place_data)
    if @destination.present?
      if place_data["photo_url"].present?
        image_url = place_data["photo_url"]
        
        # URLから画像データを取得してBase64にエンコード
        image_data = URI.open(image_url).read
        base64_image = Base64.encode64(image_data)
        
        # DBのimageカラムにエンコードされた画像データを保存
        @destination.update(image: base64_image)
      end
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
