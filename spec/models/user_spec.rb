require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validate' do
    let(:user) { build(:user) }
    context '全てのデータが正しいとき' do
      it '登録できること' do
        expect(user).to be_valid
      end
    end

    context '全てのデータが不正なとき' do
      it '登録できないこと' do
        user.name = 'x' * 51
        user.email = 'x' * 256
        user.password = 'x' * 5
        expect(user).to_not be_valid
      end
    end

    context '名前が51文字以上場合' do
      it '登録できないこと' do
        user.name = 'x' * 51
        expect(user).to_not be_valid
      end
    end

    context 'メールアドレスのフォーマットが不正な場合' do
      it '登録できないこと' do
        user.email = 'x' * 30
        expect(user).to_not be_valid
      end
    end

    context 'パスワードが5文字の場合' do
      it '登録できないこと' do
        user.password = 'x' * 5
        expect(user).to_not be_valid
      end
    end
  end
end
