require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#validate' do
    let(:post) { create(:post) }
    context '全てのデータが正しいとき' do
      it '登録できること' do
        expect(post).to be_valid
      end
    end

    context 'ユーザーIDが存在しないとき' do
      it '登録できないこと' do
        post.user_id = nil
        expect(post).to_not be_valid
      end
    end

    context 'bodyが256文字以上のとき' do
      it '登録できないこと' do
        post.body = 'x' * 256
        expect(post).to_not be_valid
      end
    end
  end
end
