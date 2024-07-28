module DestinationsHelper
  def get_photo_url(photo_reference, max_width = 400, max_height = 300)
    return photo_reference # photo_reference が URL の場合はそのまま返す
  end
end