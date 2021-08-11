class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:comment, :partner_id).merge(user_id: params[:user_id])
  end

end
