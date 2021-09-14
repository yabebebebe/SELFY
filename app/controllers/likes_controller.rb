class LikesController < ApplicationController

  before_action :set_success, only: [:show]

  def create
    unless current_user.like_successes.include?(clicked_success)
      like = current_user.likes.new(success_id: clicked_success.id)
      if like.save
        redirect_to success_path(like.success)
      else
        render "users/edit"
      end
    end
  end

  def destroy
    current_user.likes.find_by(success_id: params[:success_id]).destroy
    redirect_to root_path
  end

  private

  def clicked_success
    Success.find(params[:success_id])
  end
end
