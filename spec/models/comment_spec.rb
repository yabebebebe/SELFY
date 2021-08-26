require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do

    context '新規投稿が可能な時' do

      it '入力値が適切に存在する時' do
        expect(@comment).to be_valid
      end
      
    end

    context '新規投稿が不可能な時' do

      it 'ユーザー情報が無い時' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("ユーザーを入力してください")
      end

      it '褒めちぎりコンテンツの投稿情報が無い時' do
        @comment.message = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("褒めちぎりを入力してください")
      end    

      it 'textが空の時' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
      
    end
    
  end
end
