module DestinationsHelper
  def get_photo_url(photo_reference, _max_width = 400, _max_height = 300)
    photo_reference # photo_reference が URL の場合はそのまま返す
  end
end
