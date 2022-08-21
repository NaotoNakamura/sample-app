require 'rails_helper'

RSpec.describe Post, type: :system do
  describe '新規投稿' do
    let!(:user) { create(:user) }

    context '新規投稿フォームの入力値が正常なとき' do
      it '投稿に成功すること' do
        login(user)
        visit new_post_path
        fill_in '内容',with: 'テスト投稿'
        click_button '投稿'
        expect(page).to have_content 'テスト投稿'
      end
    end
  end
end