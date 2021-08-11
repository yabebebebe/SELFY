class MessagesController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top_page, only: [:edit, :update, :destroy]

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render "users/edit"
    end
  end

  def show
    @comment = Comment.new
    @comments = @message.comments.includes(:user)
  end

  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def update
    if @message.update(message_params)
      redirect_to root_path
    else
      render :edit
    end    
  end

  def destroy
    if @message.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :text).merge(user_id: params[:user_id])
  end

  def set_message
    @message = Message.find(params[:id]) 
  end

  def move_to_top_page
    unless current_user.id == @message.user_id
      redirect_to root_path
    end
  end 

end
