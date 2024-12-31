class SafetyTipsController < ApplicationController
  def create_daily_tip
    content = GeminiAiService.fetch_safety_tip

    if content.present?
      SafetyTip.create(content: content)
    end
  end
end
