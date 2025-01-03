Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           ENV['GOOGLE_CLIENT_ID'],
           ENV['GOOGLE_CLIENT_SECRET'], {
             scope: 'userinfo.email, userinfo.profile'
           }

  provider :line,
           ENV['LINE_CLIENT_ID'],
           ENV['LINE_SECRET']
  on_failure { |env| SessionsController.action(:failure).call(env) }
end
