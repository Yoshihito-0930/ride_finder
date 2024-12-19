class DestinationsController < ApplicationController
  before_action :require_login, only: %i[favorites]
  require 'open-uri'
  require 'base64'
  helper_method :prepare_meta_tags

  def create
    place_data = JSON.parse(params[:place_data])

    @destination = Destination.find_or_create_from_place_data(place_data)
    if @destination.present?
=begin
      # if @destination.image.blank? && place_data['photo_url'].present?
      #   image_url = place_data['photo_url']

      #   if URI.parse(image_url).scheme == 'https'
      #     # URLから画像データを取得
      #     image_data = URI.open(image_url)
      #     @destination.image.attach(
              io: downloaded_image,
              filename: "destination_image_#{SecureRandom.hex}.jpg",
              content_type: 'image/jpeg'
            )

      #   end
      # end
=end
      redirect_to destination_path(@destination)
    else
      flash.now[:alert] = '目的地の取得に失敗しました。ページをリロードしてから再度お試し下さい。'
      redirect_to :search_results
    end
  end

  def show
    @destination = Destination.find(params[:id])
    prepare_meta_tags(@destination)
  end

  def favorites
    @favorite_destinations = current_user.favorites.includes(:favorite_destinations).order(created_at: :desc)
  end

  def future_visits
    @future_visit_destinations = current_user.upcoming_destinations.includes(:future_visits).order(created_at: :desc)
  end

  private

  def prepare_meta_tags(destination)
    ## このimage_urlにMiniMagickで設定したOGPの生成した合成画像を代入する
    image_url = "#{request.base_url}/images/ogp.png?text=#{CGI.escape(destination.name)}"
    set_meta_tags og: {
                    site_name: 'Ride finder',
                    title: destination.name,
                    description: 'ユーザーによるツーリングスポットの投稿です',
                    type: 'website',
                    url: request.original_url,
                    image: image_url,
                    locale: 'ja-JP'
                  },
                  twitter: {
                    card: 'summary_large_image',
                    site: '@https://x.com/totototo0324',
                    image: image_url
                  }
  end
end
