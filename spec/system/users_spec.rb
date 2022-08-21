require 'rails_helper'

RSpec.describe User, type: :system do
  let!(:user) { create(:user, id: 1, email: 'test@example.com') }

  describe 'ログイン前' do
    context '新規登録フォームの入力値が正常なとき' do
      it '新規登録に成功すること' do
        visit signup_path
        fill_in 'ユーザー名', with: 'テスト太郎'
        fill_in 'メールアドレス', with: 'sample@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録'
        expect(page).to have_content 'テスト太郎'
      end
    end

    context '新規登録フォームの入力値が不正なとき' do
      it '新規登録に失敗すること' do
        visit signup_path
        fill_in 'ユーザー名', with: 'テスト太郎'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録'
        expect(page).to have_current_path signup_path, ignore_query: true
      end
    end

    context '新規登録時にユーザーが既に存在するとき' do
      it '新規登録に失敗すること' do
        visit signup_path
        fill_in 'ユーザー名', with: 'テスト太郎'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録'
        expect(page).to have_current_path signup_path, ignore_query: true
      end
    end

    context 'ログインフォームの入力値が正常なとき' do
      it 'ログインに成功すること' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
        expect(page).to have_current_path '/users/1'
      end
    end

    context 'ログインフォームの入力値が不正なとき' do
      it 'ログインに失敗すること' do
        visit login_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end

    context 'ログイン時にユーザーが存在しないとき' do
      it 'ログインに失敗すること' do
        visit login_path
        fill_in 'メールアドレス', with: 'xxxx@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end

    context 'root_pathにアクセスしたとき' do
      it 'ログイン画面にリダイレクトすること' do
        visit root_path
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end

    context '新規投稿画面にアクセスしたとき' do
      it 'ログイン画面にリダイレクトすること' do
        visit new_post_path
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end

    context 'ユーザー詳細画面にアクセスしたとき' do
      it 'ログイン画面にリダイレクトすること' do
        visit user_path(user)
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end
  end

  describe 'ログイン後' do
    before { login(user) }

    context 'root_pathにアクセスしたとき' do
      it 'ホーム画面にアクセスできること' do
        visit root_path
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context '新規投稿画面にアクセスしたとき' do
      it '新規投稿画面にアクセスできること' do
        visit new_post_path
        expect(page).to have_current_path new_post_path, ignore_query: true
      end
    end

    context 'ユーザー詳細画面にアクセスしたとき' do
      it 'ユーザー詳細画面にアクセスできること' do
        visit user_path(user)
        expect(page).to have_current_path user_path(user), ignore_query: true
      end
    end

    context '新規ユーザー登録画面にアクセスしたとき' do
      it 'ホーム画面にリダイレクトされること' do
        visit signup_path
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context 'ログイン画面にアクセスしたとき' do
      it 'ホーム画面にリダイレクトされること' do
        visit login_path
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context 'ログアウトリンクをクリックしたとき' do
      it 'ログイン画面にリダイレクトされること' do
        click_link 'ログアウト'
        expect(page).to have_current_path login_path, ignore_query: true
      end
    end
  end
end
