require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいくとき' do
      it '新規登録が上手くいくとき' do
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'メールアドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("携帯メールアドレスを入力してください")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("携帯メールアドレスはすでに存在します")
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = '123.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("携帯メールアドレスは不正な値です")
      end

      it 'パスワードが必須であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '1111a'
        @user.password_confirmation = '1111a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
      end

      it 'パスワードは、半角英数字混合での入力が必須であること(半角英字のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'パスワードは、半角英数字混合での入力が必須であること(数字のみ)' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password = 'abcd1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it '生年月日が必須であること' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth dateを入力してください")
      end

      it '携帯番号はハイフンがあると保存できないこと' do
        @user.phone_number = '111-1111-1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("携帯番号は不正な値です")
      end

      it '携帯番号は11桁でなければ保存できないこと' do
        @user.phone_number = '111111111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("携帯番号は不正な値です")
      end

      it '市町村以降の住所が空だと保存できないこと' do
        @user.address = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("市町村以降の住所を入力してください")
      end

      it "area_idが空では登録できないこと" do
        @user.area_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("市町村を入力してください")
      end
    end
  end
end
