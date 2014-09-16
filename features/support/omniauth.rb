Before('@omniauth_test') do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: 'facebook',
    uid: '118181138998978630963',
    info:
    {
      email: 'test@xxxx.com',
      first_name: 'Test',
      last_name: 'User',
      name: 'Test User'
    }
  )
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
end
