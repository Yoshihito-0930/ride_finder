class VisitCategory < ApplicationRecord
  enum name: { scenic_spot: 0, tourist_attraction: 1, roadside_station: 2 }
end
