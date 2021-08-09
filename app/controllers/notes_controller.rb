class NotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @note = Note.new(note_params)
    if @note.save
      ActionCable.server.broadcast 'note_channel', content: @note
    else
      redirect_to root_path
    end
  end

  def destroy
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    if @user.notes.destroy_all
      redirect_to root_path
    else
      render :edit
    end     
  end

  private

  def note_params
    params.require(:note).permit(:comment).merge(user_id: params[:user_id])
  end
end
