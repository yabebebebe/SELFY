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

    context '新規登録が不可能な時' do

      it 'ユーザー情報が無い時' do
        @emotion.user = nil
        @emotion.valid?
        expect(@emotion.errors.full_messages).to include("User must exist")
      end

      context '各項目の入力値が空の時' do
        
        it 'titleが空の時' do
          @emotion.title = ''
          @emotion.valid?
          expect(@emotion.errors.full_messages).to include("Title can't be blank")
        end

        it 'textが空の時' do
          @emotion.text = ''
          @emotion.valid?
          expect(@emotion.errors.full_messages).to include("Text can't be blank")         
        end

      end
      
    end

  end
end
