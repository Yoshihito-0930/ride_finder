class GeminiAiService
  BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=#{ENV['GOOGLE_MAPS_API_KEY']}".freeze

  def self.fetch_safety_tip
    request_body = {
      contents: [
        {
          parts: [
            { text: "あなたはプロのライダーです。以下のテーマからランダムに1つ選び、選ばれたテーマ一つに絞って130文字以内の交通安全情報を発信してください。最後に「今日も気を付けていってらっしゃい！」と締めてください。

            テーマ:
            - バイクの操作（低速・高速運転、初心者向けの扱い方）
            - 速度
            - 天気
            - 路面
            - 運転手の心理（焦り、苛立ちなど）
            - 気温
            - 時間帯（夜間、通学時間帯、通勤退勤時間帯など）
            - 季節
            - 服装
            - 過去の事故傾向を使った注意喚起
            - 周りの車の状況（視認性、右直事故リスク、煽り運転など）
            - その他バイクの安全に関するもの文字数を厳守してください。" }
          ]
        }
      ]
    }.to_json

    response = HTTParty.post(
      BASE_URL,
      headers: {
        'Content-Type' => 'application/json'
      },
      body: request_body
    )

    return unless response.success?

    parsed_response = JSON.parse(response.body)
    parsed_response.dig('candidates', 0, 'content', 'parts', 0, 'text')
  end
end
