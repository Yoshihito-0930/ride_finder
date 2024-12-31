class GeminiAiService
  BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{ENV['GOOGLE_MAPS_API_KEY']}"

  def self.fetch_safety_tip
    request_body = {
      contents: [
        {
          parts: [
            { text: "あなたはプロのライダーです。リクエストされる度に違う内容のバイクの交通安全知識を120文字以内で発信します。120文字の返信内容の最後に追加で「今日も気を付けていってらっしゃい！」で締めて下さい。返信内容には日付を入れないで下さい。
            発信内容には以下の中にある要素の中からランダムに一つの要素を選択し、選んだ要素についての交通安全情報を返信して下さい。
            ・バイクの操作(低速や高速運転時、初心者向けのバイクの扱い方等)
            ・速度
            ・天気
            ・路面
            ・運転手の心理(焦りや苛立ち等）
            ・気温
            ・時間帯(夜間や通学時間帯、通勤退勤時間帯やその他も考慮)
            ・季節
            ・服装
            ・過去の事故の情報を使った注意喚起
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
      safety_tip_text = "交通安全情報の取得に失敗しました。"
      safety_tip_text
    end
  rescue StandardError => e
    Rails.logger.error("Exception: #{e.message}")
    safety_tip_text = "交通安全情報の取得に失敗しました。"
  end
end