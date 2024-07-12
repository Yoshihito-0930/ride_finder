class SafetyTipsController < ApplicationController
  def index
    @today_tip = SafetyTip.order(created_at: :desc).first
  end
end
