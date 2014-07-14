module DoorkeeperApiV1
  private

  def access_token
    return @access_token if defined?(@access_token)
    config = Devise.omniauth_configs[:doorkeeper]
    strategy = config.strategy_class.new(*config.args)
    token = session[:doorkeeper_token]
    @access_token = OAuth2::AccessToken.new(strategy.client, token)
  end

  def get_me
    access_token.get("/api/v1/me.json").parsed
  end

  def get_microposts
    access_token.get("/api/v1/microposts.json").parsed
  end

  MICROPOST_CONTENT_MAX_LENGTH = 140

  def post_micropost(micropost)
    micropost[:content] = micropost[:content].truncate(MICROPOST_CONTENT_MAX_LENGTH)
    access_token.post("/api/v1/microposts", params: { micropost: micropost }).parsed
  end
end
