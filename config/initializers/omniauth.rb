OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  facebook_app_id = '842259755793401'
  facebook_secret = '92d285eb1ddd0af261ed0359318a3212'
  provider :facebook, facebook_app_id, facebook_secret
end
