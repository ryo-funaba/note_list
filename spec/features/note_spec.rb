require "rails_helper"

RSpec.feature "note", type: :feature  do
  let(:user) { create(:user, email: "test@example.com", nickname: "test_user") }
  let!(:note) { create(:note) }
  let!(:review) { create(:review) }
  
  background do
    user.password = "password"
    user.save
    visit new_user_session_path
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "password", with: "password"
    click_button "ログイン"
    expect(current_path).to eq root_path
  end
  
  scenario "一覧表示する" do
    expect(page).to have_content "プログラミング"
  end
  
  scenario "詳細画面に遷移する" do
    expect(page).to have_content "プログラミング"
  end
  
  scenario "検索する" do
    fill_in "keyword", with: "プログラミング" + "\n"
    expect(page).to have_content "プログラミング"
  end
  
  scenario "タイトルロゴをクリックする" do
    find('img.header_title-btn').click
    expect(current_path).to eq root_path
  end
  
  scenario "投稿画面に遷移する" do
    click_link "投稿する"
    expect(current_path).to eq new_review_path
  end
  
  scenario "マイページに遷移する" do
    click_link "マイページ"
    expect(current_path).to eq user_path(user)
  end
  
  scenario "サインアウト" do
    click_link "サインアウト"
    expect(current_path).to eq new_user_session_path
  end
  
end