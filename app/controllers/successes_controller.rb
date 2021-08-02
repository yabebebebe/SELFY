class SuccessesController < ApplicationController

  def create
    @success = Success.new(success_params)
    if @success.save
      redirect_to root_path
    else
      render "users/show"
    end
  end

  def show
    @success = Success.find(params[:id])
  end

  private

  def success_params
    params.require(:success).permit(:title, :text).merge(user_id: params[:user_id])
  end

end
