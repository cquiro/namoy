class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Has iniciado sesión en el sistema de manejo de contenido de Namoy"
      redirect_to root_path
    else
      flash[:error] = "Por favor revisa tu usuario y contraseña e intenta de nuevo"
      render :new
    end
  end
end
