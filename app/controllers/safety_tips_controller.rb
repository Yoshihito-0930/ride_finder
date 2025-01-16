class SafetyTipsController < ApplicationController
  def create_daily_tip
    content = GeminiAiService.fetch_safety_tip

    SafetyTip.create(content: content) if content.present?
  end
end
