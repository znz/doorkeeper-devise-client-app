module AuthDoorkeeper
  private

  def auto_authenticate_omniauth_user!
    return if current_user
    session[:user_return_to] = request.original_url
    redirect_to main_app.user_omniauth_authorize_path(:doorkeeper)
  end
end
