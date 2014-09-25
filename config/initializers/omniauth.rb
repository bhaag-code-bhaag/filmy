OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  facebook_hash = Rails.application.secrets[:facebook]

  provider :facebook, facebook_hash[:app_id], facebook_hash[:secret]
end
