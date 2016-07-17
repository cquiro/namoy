class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      MessageMailer.password_reset(user).deliver_now
      redirect_to namoy_manejo_contenido_path
      # render :new
      
      flash[:success] = "Te hemos enviado un email para restablecer tu contraseña."
    else
      flash.now[:error] = "No tenemos un usuario con ese email."
      render :new
    end
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])

    if @user
    else
      render file: 'public/404.html', status: :not_found
    end
  end
end
