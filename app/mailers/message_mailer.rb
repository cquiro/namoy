class MessageMailer < ApplicationMailer
  default_url_options[:host] = "http://namoy-env.fbtkmyrbm2.us-west-2.elasticbeanstalk.com/"
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
