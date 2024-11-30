class VisitCategory < ApplicationRecord
  has_many :destinations
  enum name: { scenic_spot: 0, tourist_attraction: 1, roadside_station: 2, campground: 3, viewpoint: 4, riders_cafe: 5 }
end
