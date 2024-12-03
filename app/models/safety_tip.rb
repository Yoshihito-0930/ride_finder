class SafetyTip < ApplicationRecord
  validates :content, presence: true

  def self.generate_daily_safety_tip
    prompt = <<~PROMPT
      今日のバイクの交通安全情報を日本語で教えてください。
      詳細には、天候、交通量、注意が必要な道路条件を含めてください。
    PROMPT

    service = GeminiService.new(prompt)
    response = service.generate_text

    if response['choices']
      create(content: response['choices'].first['text'])
    else
      Rails.logger.error '交通安全情報の生成に失敗しました。'
    end
  end
end
