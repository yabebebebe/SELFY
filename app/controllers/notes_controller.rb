class NotesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @note = Note.new(note_params)
    if @note.save
      #ActionCable.server.broadcast 'message_channel', content: @message
      redirect_to root_path
    end
  end

  private

  def note_params
    params.require(:note).permit(:comment).merge(user_id: params[:user_id])
  end
end
