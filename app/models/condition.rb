class Condition < ApplicationRecord
  belongs_to :user

  enum type: { distance: 0, time: 1 }
end
