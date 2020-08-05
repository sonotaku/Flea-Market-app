require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user) 

      # 誕生日セレクトボックスから選択

      # select "opton[value=2000]", from: "user[birth_date(1i)]"
      # select '2', from: 'user[birth_date(2i)]'
      # select '23', from: 'user[birth_date(3i)]'
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "全ての項目が存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it "family_nameとfirst_nameがひらがなでもログインできる" do
          @user.family_name = "やまだ"
          @user.first_name = "たろう"
          expect(@user).to be_valid
        end
        it "family_nameとfirst_nameがカタカナでもログインできる" do
          @user.family_name = "ヤマダ"
          @user.first_name = "タロウ"
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameがからでは登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank", "Email is invalid")
        end
        it "重複したemailが存在する場合登録できないこと" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
        end
        it "emailが＠を含んでないと登録できない" do
          @user.email = "hogefuga"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
        end
        it "passwordが空だと登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下だと登録できない" do
          @user.password = "abc12"
          @user.password_confirmation = "abc12"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passswordが半角英数字混合ではない場合、登録できない" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?

        end
        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "family_nameが空だと登録できないこと" do
          @user.family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
        end
        it "first_nameが空だと登録できないこと" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
        end
        it "family_nameが全角（ひらがな、カタカナ、漢字）以外だと登録できないこと" do
          @user.family_name = "ﾔﾏﾀﾞ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end
        it "first_nameが半角だと登録できないこと" do
          @user.first_name = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it "flat_family_nameが空だと登録できないこと" do
          @user.flat_family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Flat family name can't be blank", "Flat family name is invalid")
        end
        it "flat_first_nameが空だと登録できないこと"do
            @user.flat_first_name = ""
            @user.valid?
            expect(@user.errors.full_messages).to include("Flat first name can't be blank", "Flat first name is invalid")
        end
          
        it "flat_family_nameがひらがなだと登録できないこと" do
          @user.flat_family_name = "やまだ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Flat family name is invalid")
        end
        it "flat_first_nameがひらがなだと登録できないこと" do
          @user.flat_first_name = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Flat first name is invalid")
        end
          
        it "flat_family_nameが半角だと登録できないこと" do
          @user.flat_family_name = "ﾔﾏﾀﾞ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Flat family name is invalid")
        end

        it "flat_first_nameが半角だと登録できないこと" do
          @user.flat_first_name = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Flat first name is invalid")
        end
        it "生年月日がないと登録できないこと" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end