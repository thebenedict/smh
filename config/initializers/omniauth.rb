Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
  :info_fields => 'email,name,first_name',
  :image_size => {width: 150, height: 150}
end

OmniAuth.config.failure_raise_out_environments = []