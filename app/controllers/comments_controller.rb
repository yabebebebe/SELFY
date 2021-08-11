class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to message_path(@comment.message)
      else
        render "users/edit"
      end    
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, message_id: params[:message_id])
  end
end
