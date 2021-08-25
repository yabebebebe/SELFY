require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)   
  end

  describe '褒めちぎりコンテンツ新規投稿' do
    
    context '新規投稿が可能な時' do

      it '全ての項目の入力値が適切に存在する時' do
        expect(@message).to be_valid
      end
      
    end

    context '新規投稿が不可能な時' do

      it 'ユーザー情報が無い時' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("ユーザーを入力してください")
      end
        
      context '各項目の入力値が空の時' do
        
        it 'titleが空の時' do
          @message.title = ''
          @message.valid?
          expect(@message.errors.full_messages).to include("タイトルを入力してください")
        end

        it 'textが空の時' do
          @message.text = ''
          @message.valid?
          expect(@message.errors.full_messages).to include("内容を入力してください")         
        end

      end
      
    end

  end

end