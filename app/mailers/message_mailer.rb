class MessageMailer < ApplicationMailer
  default_url_options[:host] = "localhost:3000"
  default to: "info@namoy.co"

  def message_me(msg)
    @msg = msg
    mail from: @msg.email, subject: @msg.subject
  end

  def password_reset(user)
    @user = user
    mail to: "#{user.name} <#{user.email}>", subject: "Restablece tu contraseña" 
  end
end
