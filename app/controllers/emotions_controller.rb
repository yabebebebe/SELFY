class EmotionsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_emotion, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top_page, only: [:edit, :update, :destroy]
  
  def create
    @emotion = Emotion.new(emotion_params)
    if @emotion.save
      redirect_to root_path
    else
      render "users/show"
    end
  end

  def show

  end

  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def update
    if @emotion.update(emotion_params)
      redirect_to root_path
    else
      render :edit
    end    
  end

  def destroy
    if @emotion.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def emotion_params
    params.require(:emotion).permit(:title, :text).merge(user_id: params[:user_id])
  end

  def set_emotion
    @emotion = Emotion.find(params[:id]) 
  end

  def move_to_top_page
    unless current_user.id == @emotion.user_id
      redirect_to root_path
    end
  end

end
