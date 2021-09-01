class LikesController < ApplicationController

  before_action :set_success, only: [:show]

  def create
    unless current_user.like_successes.include?(clicked_success)
      like = current_user.likes.new(success_id: clicked_success.id)
      if like.save
        redirect_to root_path
      else
        render "users/edit"
      end
    end
  end

  def destroy
    
  end

  private

  def clicked_success
    Success.find(params[:success_id])
  end
end
