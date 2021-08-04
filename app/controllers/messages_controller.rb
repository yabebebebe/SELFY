class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render "users/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:comment).merge(user_id: params[:user_id])
  end

end
