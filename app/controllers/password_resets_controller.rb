class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.generate_password_reset_token!
    redirect_to namoy_manejo_contenido_path
  end
end
