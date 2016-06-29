class MessageMailer < ApplicationMailer
  default to: "quiroga.developer@gmail.com"#"info@namoy.co"

  def message_me(msg)
    @msg = msg
    mail from: @msg.email, subject: @msg.subject
  end
end
