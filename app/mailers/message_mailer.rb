class MessageMailer < ApplicationMailer
  default to: "info@namoy.co"

  def message_me(msg)
    @msg = msg
    mail from: @msg.email, subject: @msg.subject
  end
end
