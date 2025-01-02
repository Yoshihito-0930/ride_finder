class GeminiAiService
  BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{ENV['GOOGLE_MAPS_API_KEY']}"

  def self.fetch_safety_tip
    request_body = {
      contents: [
        {
          parts: [
            { text: "あなたはプロのライダーです。バイクの安全知識を120文字以内で発信します。120文字の返信内容の最後に追加で「今日も気を付けていってらっしゃい！」で締めて下さい。
            発信内容には以下の要素の中からランダムに一つの要素を選択し、選んだ要素についての交通安全情報を返信して下さい。
            ・バイクの操作(低速や高速運転時、初心者向けのバイクの扱い方等)
            ・速度
            ・天気
            ・路面
            ・運転手の心理(焦り、苛立ち等）
            ・気温
            ・時間帯(夜間、通学時間帯、通勤退勤時間帯、その他)
            ・季節
            ・服装
            ・過去の事故の傾向を使った注意喚起
            ・周りの車の状況（周りの車からの視認されにくい状況や右直事故のリスクや煽り運転等にあった時の対処法など）
            ・その他バイクの安全に関するもの
            "
            }
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

      safety_tip_text = parsed_response.dig('candidates', 0, 'content', 'parts', 0, 'text')
      Rails.logger.info("Generated Safety Tip: #{safety_tip_text}")
      safety_tip_text
    else
      Rails.logger.error("Error: #{response.code} - #{response.message}")
      nil
    end
  rescue StandardError => e
    Rails.logger.error("Exception: #{e.message}")
    nil
  end
end