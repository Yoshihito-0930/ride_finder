class GeminiAiService
  BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{ENV['GEMINI_API_KEY']}"
  
  def self.fetch_safety_tip
    request_body = {
      contents: [
        {
          parts: [
            { text: "Generate a 100-character traffic safety tip for bikers." }
          ]
        }
      ]
    }.to_json
  
    Rails.logger.info("Request Body: #{request_body}")
  
    response = HTTParty.post(
      BASE_URL,
      headers: {
        'Content-Type' => 'application/json'
      },
      body: request_body
    )
  
    Rails.logger.info("Response Code: #{response.code}")
    Rails.logger.info("Response Body: #{response.body}")
  
    if response.success?
      parsed_response = JSON.parse(response.body)
      Rails.logger.info("Parsed Response: #{parsed_response}")
      parsed_response['text'] # AIが生成した内容を返す
    else
      Rails.logger.error("Error: #{response.code} - #{response.message}")
      nil
    end
  rescue StandardError => e
    Rails.logger.error("Exception: #{e.message}")
    nil
  end
end
