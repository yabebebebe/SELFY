require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('app/assets/images/test_image.png')
    sleep 0.01
  end

  describe 'ユーザー新規登録' do
    
    context '新規登録が可能な時' do

      it '全ての項目の入力値が適切に存在する時' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上の時' do
        @user.password = 'yb0000'
        @user.password_confirmation = 'yb0000'
        expect(@user).to be_valid
      end

      it 'phoneが下限10桁の時' do
        @user.phone = '1234567890'
        expect(@user).to be_valid
      end
      
    end

    context '新規登録が不可能な時' do
      
      context '各項目の入力値が空の時' do

        it 'imageが空の時' do
          @user.image = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("プロフィール画像を入力してください")
        end

        it 'nicknameが空の時' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("ユーザー名を入力してください")          
        end

        it 'nameが空の時' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("本名を入力してください")
        end

        it 'emailが空の時' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")          
        end

        it 'passwordが空の時' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")          
        end

        it 'birthdayが空の時' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("生年月日を入力してください")       
        end

        it 'phoneが空の時' do
          @user.phone = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("電話番号は半角数字（ハイフンは含まない）入力のみ可能です")          
        end
        
      end

      context 'その他のバリデーションに該当する時' do

        it '重複したemailが存在する時' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")          
        end

        it 'emailに@を含まない時' do
          @user.email = 'selfy.email'
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")         
        end

        it 'passwordが5文字以下の時' do
          @user.password ='yb000'
          @user.password_confirmation ='yb000'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")         
        end

        it 'passwordとpassword_confirmationが不一致の時' do
          @user.password = 'test0000'
          @user.password_confirmation = 'yabebe1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")          
        end

        it 'passwordが全角の英数字混合の時' do
          @user.password = 'ｔｅｓｔ００００'
          @user.password_confirmation = 'ｔｅｓｔ００００'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角（英字・数字）の混合入力のみ可能です")         
        end

        it 'passwordが英字のみの時' do
          @user.password = 'yabebe'
          @user.password_confirmation = 'yabebe'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角（英字・数字）の混合入力のみ可能です") 
        end

        it 'passwordが数字のみの時' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは半角（英字・数字）の混合入力のみ可能です")          
        end

        it 'nameが半角入力の時' do
          @user.name = 'ﾔﾍﾞﾕﾒﾉ'
          @user.valid?
          expect(@user.errors.full_messages).to include("本名は全角（漢字・ひらがな・カタカナ）入力のみ可能です")          
        end

        it 'nameが英字の時' do
          @user.name = 'YumenoYabe'
          @user.valid?
          expect(@user.errors.full_messages).to include("本名は全角（漢字・ひらがな・カタカナ）入力のみ可能です")         
        end

        it 'nameが数字の時' do
          @user.name = '0000'
          @user.valid?
          expect(@user.errors.full_messages).to include("本名は全角（漢字・ひらがな・カタカナ）入力のみ可能です")         
        end

        it 'phoneが10桁未満の時' do
          @user.phone = '123456789'
          @user.valid?
          expect(@user.errors.full_messages).to include("電話番号は半角数字（ハイフンは含まない）入力のみ可能です")         
        end

        it 'phoneが11桁より上の時' do
          @user.phone = '123456789012'
          @user.valid?
          expect(@user.errors.full_messages).to include("電話番号は半角数字（ハイフンは含まない）入力のみ可能です")          
        end

        it 'phoneが英数混合の時' do
          @user.phone = '12345abcde'
          @user.valid?
          expect(@user.errors.full_messages).to include("電話番号は半角数字（ハイフンは含まない）入力のみ可能です")          
        end
        
      end

    end

  end

end