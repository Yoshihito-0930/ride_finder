class GeminiService
  include HTTParty
  base_uri 'https://api.gemini.com'

  def initialize(api_key)
    @headers = { "Authorization" => "Bearer #{api_key}" }
  end

  def fetch_daily_safety_tip
    response = self.class.get('/v1/daily_safety_tip', headers: @headers)
    if response.success?
      response.parsed_response
    else
      raise "API request failed with response code #{response.code}"
    end
  end
end