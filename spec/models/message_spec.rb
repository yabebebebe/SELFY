require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)   
  end

  describe '褒めちぎりコンテンツ新規投稿' do
    
    context 'メッセージ送信が可能な時' do

      it '入力値が適切に存在する時' do
        expect(@message).to be_valid
      end
      
    end

    context 'メッセージ送信が不可能な時' do

      it 'ユーザー情報が無い時' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end
        
      it 'commentが空の時' do
        @message.comment = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Comment can't be blank")
      end
      
    end

  end

end