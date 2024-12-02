require 'rails_helper'

RSpec.describe VisitCategory, type: :model do
  describe 'バリデーションチェック' do
    it '設定したenumが機能しているか' do
      visit_category_keys = VisitCategory.names.keys
      visit_category_values = VisitCategory.names.values
      expect(visit_category_keys).to match_array(%w[scenic_spot tourist_attraction roadside_station campground
                                                    viewpoint riders_cafe])
      expect(visit_category_values).to match_array([0, 1, 2, 3, 4, 5])
    end
  end
end
