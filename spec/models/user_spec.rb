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
        expect(user).not_to be_valid
      end
    end

    context '名前が51文字以上場合' do
      it '登録できないこと' do
        user.name = 'x' * 51
        expect(user).not_to be_valid
      end
    end

    context 'メールアドレスのフォーマットが不正な場合' do
      it '登録できないこと' do
        user.email = 'x' * 30
        expect(user).not_to be_valid
      end
    end

    context 'パスワードが5文字の場合' do
      it '登録できないこと' do
        user.password = 'x' * 5
        expect(user).not_to be_valid
      end
    end
  end

  describe '#relationships' do
    let(:current_user) { create(:user) }
    let(:user) { create(:user) }

    context 'フォローするユーザーとフォローされるユーザーが異なるとき' do
      it 'フォローできること' do
        expect(current_user.follow(user)).to be_valid
      end
    end

    context 'フォローするユーザーとフォローされるユーザーが同じとき' do
      it 'フォローできないこと' do
        current_user.follow(current_user)
        expect(current_user.followings.include?(current_user)).to be false 
      end
    end

    context 'ユーザーをフォローしているとき' do
      it 'フォロー解除できること' do
        current_user.follow(user)
        expect(current_user.unfollow(user)).to be_valid
      end
    end

    context 'フォロー中のユーザーが存在するとき' do
      it 'trueになること' do
        current_user.follow(user)
        expect(current_user.following?(user)).to be true
      end
    end

    context 'フォロー中のユーザーが存在しないとき' do
      it 'falseになること' do
        expect(current_user.following?(user)).to be false 
      end
    end
  end
end
