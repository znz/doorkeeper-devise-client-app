class User < ActiveRecord::Base
  devise :omniauthable, omniauth_providers: [:doorkeeper]
  devise :timeoutable
  include DoorkeeperOauthFinder
end
