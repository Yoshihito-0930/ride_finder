class GeminiAiService
  BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{ENV['GOOGLE_MAPS_API_KEY']}"

  def self.fetch_safety_tip
    request_body = {
      contents: [
        {
          parts: [
            { text: "あなたはプロのバイク乗りです。一日一回バイクの交通安全情報を発信します。発信内容には「天気・路面・気温・時間帯(夜間や通学時間帯、通勤退勤時間帯やその他も考慮)・季節・服装・その他バイクの安全に関するもの」等を考慮して120文字以内で返信して下さい。120文字の返信内容の最後に追加で「今日も気を付けていってらっしゃい！」で締めて下さい" }
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

      # テキストをレスポンスから取得
      candidate_text = parsed_response.dig('candidates', 0, 'content', 'parts', 0, 'text')
      Rails.logger.info("Generated Safety Tip: #{candidate_text}")
      candidate_text
    else
      Rails.logger.error("Error: #{response.code} - #{response.message}")
      nil
    end
  rescue StandardError => e
    Rails.logger.error("Exception: #{e.message}")
    nil
  end
end