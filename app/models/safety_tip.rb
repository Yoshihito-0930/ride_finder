class SafetyTip < ApplicationRecord
  validates :content, presence: true
end
