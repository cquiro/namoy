class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.message_me(@message).deliver_now
      redirect_to locations_path, notice: "Gracias por escribirnos."
    else
      flash[:alert] = "No se pudo enviar el mensaje. Por favor intenta de nuevo."
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :message)
  end
end
