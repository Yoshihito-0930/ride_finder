class DailySafetyTipJob < ApplicationJob
  queue_as :default

  def perform
    gemini_service = GeminiService.new(ENV['GEMINI_API_KEY'])
    tip = gemini_service.fetch_daily_safety_tip
    SafetyTip.create(content: tip["message"])
  end
end