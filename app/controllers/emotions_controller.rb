class EmotionsController < ApplicationController

  before_action :set_emotion, only: :show

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

  private

  def emotion_params
    params.require(:emotion).permit(:title, :text).merge(user_id: params[:user_id])
  end

  def set_emotion
    @emotion = Emotion.find(params[:id]) 
  end

end
