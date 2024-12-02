require 'google/cloud/ai_platform'

Google::Cloud::AIPlatform.configure do |config|
  config.credentials = ENV['GOOGLE_APPLICATION_CREDENTIALS']
end
