class WelcomeController < ApplicationController
  include DoorkeeperApiV1

  def index
    @me = get_me
    @microposts = get_microposts
  end

  def post
    content = params.permit(:content)[:content]
    if content.blank?
      redirect_to root_url
      return
    end
    result = post_micropost(content: content)
    redirect_to root_url, notice: "Posted: #{result.inspect}"
  rescue OAuth2::Error
    redirect_to root_url, alert: "Post error"
  end
end
