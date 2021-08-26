require 'rails_helper'

RSpec.describe Emotion, type: :model do
  before do
    @emotion = FactoryBot.build(:emotion) 
  end

  describe '情緒的喚起コンテンツ新規投稿' do
    
    context '新規投稿が可能な時' do

      it '全ての項目の入力値が適切に存在する時' do
        expect(@emotion).to be_valid
      end
      
    end

    context '新規投稿が不可能な時' do

      it 'ユーザー情報が無い時' do
        @emotion.user = nil
        @emotion.valid?
        expect(@emotion.errors.full_messages).to include("ユーザーを入力してください")
      end

      context '各項目の入力値が空の時' do
        
        it 'titleが空の時' do
          @emotion.title = ''
          @emotion.valid?
          expect(@emotion.errors.full_messages).to include("タイトルを入力してください")
        end

        it 'textが空の時' do
          @emotion.text = ''
          @emotion.valid?
          expect(@emotion.errors.full_messages).to include("内容を入力してください")         
        end

      end
      
    end

  end
end
