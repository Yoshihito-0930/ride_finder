class StaticPagesController < ApplicationController
  def top
    @safety_info = SafetyTip.last[:content]
  end
end
