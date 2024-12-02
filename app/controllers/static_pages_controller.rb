class StaticPagesController < ApplicationController
  def top
    @safety_info = SafetyTip.order(created_at: :desc).first
  end
end
