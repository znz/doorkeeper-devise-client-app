class WelcomeController < ApplicationController
  include DoorkeeperApiV1

  def index
    @microposts = get_microposts
  end
end
