class Condition < ApplicationRecord
  belongs_to :user

  enum condition_type: { distance: 0, time: 1 }
end
