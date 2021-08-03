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

  def edit
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @success = Success.find(params[:id])   
  end

  def update
    @success = Success.find(params[:id])
    if @success.update(success_params)
      redirect_to root_path
    else
      render :edit
    end    
  end

  private

  def success_params
    params.require(:success).permit(:title, :text).merge(user_id: params[:user_id])
  end

end
