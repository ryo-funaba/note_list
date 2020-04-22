require "rails_helper"

RSpec.feature "レビュー", type: :feature  do
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
  
  scenario "投稿する" do
    visit new_review_path
    expect(current_path).to eq new_review_path
    fill_in "レビュー先URL", with: "https://note.com/shino74/n/nb1038b87ea94"
    fill_in "評価", with: 5
    fill_in "レビュー", with: "面白い"
    click_button "投稿する"
    expect(current_path).to eq root_path
  end
  
  scenario "投稿を編集する" do
    visit edit_note_review_path(note, review)
    expect(page).to have_content "初レビュー"
    fill_in "レビュー", with: "編集後レビュー"
    click_button "修正する"
    expect(page).to have_content "編集後レビュー"
  end
  
  scenario "投稿を削除する" do
    visit edit_note_review_path(note, review)
    expect(page).to have_content "初レビュー"
    click_link "削除する"
    expect(current_path).to eq root_path
  end
  
end