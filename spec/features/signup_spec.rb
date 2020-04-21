require 'rails_helper'

RSpec.feature "ユーザー", type: :feature do
  
  context "新規登録" do

    scenario "ボタンの確認" do
      visit root_path
      expect(page).to have_content '新規登録'
    end
    
    scenario "画面に遷移" do
      visit root_path
      click_link "新規登録"
      expect(page).to have_content "メールアドレス"
    end
    
    scenario "実行" do
      visit new_user_registration_path
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード (確認)", with: "password"
      fill_in "ニックネーム", with: "test_user"
      attach_file "プロフィール画像", "#{Rails.root}/spec/factories/rspec_profile.jpg"
      click_button '新規登録'
      expect(page).to have_content "サインアウト"
    end
    
    scenario "画面からログイン画面に遷移" do
      visit new_user_registration_path
      find("#login_link").click
      expect(page).to have_content "パスワードを忘れた方"
    end
    
  end
  
end