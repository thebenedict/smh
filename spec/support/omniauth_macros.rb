module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider' => 'facebook',
      'uid' => '123545',
      'info' => {
        'email' => 'mockuser@mock.com',
        'first_name' => 'Mockfirstname',
        'name' => 'Mock User',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
        'expires_at' => 1460935055,
        'expires' => true
      }
    })
  end
end