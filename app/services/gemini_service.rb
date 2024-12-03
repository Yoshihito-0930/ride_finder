require 'google/cloud/ai_platform'

class GeminiService
  def initialize(prompt)
    @client = Google::Cloud::AIPlatform.prediction_service
    @prompt = prompt
  end

  # 適切なリージョンに変更
  def generate_text
    model = "projects/#{ENV['GOOGLE_CLOUD_PROJECT']}/locations/asia-northeast1/models/google/gemini-1.5-flash-002"

    request = {
      endpoint: model,
      instances: [{ content: @prompt }]
    }

    response = @client.predict(request)
    response.predictions.first # 生成されたテキストを取得
  rescue StandardError => e
    Rails.logger.error("Gemini API Error: #{e.message}")
    nil
  end
end
