class UsersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @success = Success.new
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
