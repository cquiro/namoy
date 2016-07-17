class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      MessageMailer.password_reset(user).deliver_now
      # redirect_to namoy_manejo_contenido_path
      render :new
      flash.now[:success] = "Te hemos enviado un email para restablecer tu contraseña."
    else
      flash[:error] = "No tenemos un usuario con ese email."
      render :new
    end
  end
end
