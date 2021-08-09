require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @note = FactoryBot.build(:note)   
  end

  describe 'MyNoteコンテンツ新規投稿' do
    
    context 'メッセージ送信が可能な時' do

      it '入力値が適切に存在する時' do
        expect(@note).to be_valid
      end
      
    end

    context 'メッセージ送信が不可能な時' do

      it 'ユーザー情報が無い時' do
        @note.user = nil
        @note.valid?
        expect(@note.errors.full_messages).to include("User must exist")
      end
        
      it 'commentが空の時' do
        @note.comment = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Comment can't be blank")
      end
      
    end

  end

end