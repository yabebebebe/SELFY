class UsersController < ApplicationController

  def index
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @success = Success.new
    @successes = Success.all.order("created_at DESC")   
  end

  def show
    
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end

end
