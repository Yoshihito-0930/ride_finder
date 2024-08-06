class FutureVisit < ApplicationRecord
  belongs_to :user
  belongs_to :desitination

  validates :user_id, uniqueness: { scope: :desitination_id }
end
