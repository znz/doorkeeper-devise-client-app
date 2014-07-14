module DoorkeeperOauthFinder
  extend ActiveSupport::Concern

  module ClassMethods
    def find_or_create_for_doorkeeper_oauth(oauth_data)
      uid = oauth_data.uid.to_s
      id = uid.to_i
      user = self.where(provider: oauth_data.provider, uid: uid).first
      if user
        user.name = oauth_data.info.name
        user.email = oauth_data.info.email
        user.save! if user.changed?
      else
        user = self.create!({
          id: id, # use same id
          name: oauth_data.info.name,
          provider: oauth_data.provider,
          uid: uid,
          email: oauth_data.info.email,
          #password: Devise.friendly_token[0,20]
        })
      end
      user
    end
  end
end
