require 'rails_helper'

RSpec.feature 'レビュー', type: :feature  do
  let(:user) { create(:user, email: 'test@example.com', nickname: 'test_user') }
  let!(:note) { create()}
  
  background do
    user.password = 'password'
    user.save
    visit new_user_session_path
    fill_in 'メールアドレス', with: "test@example.com"
    fill_in 'password', with: "password"
    click_button "ログイン"
    expect(current_path).to eq root_path
  end
  
  # scenario "投稿する" do
  #   visit new_review_path
  #   expect(current_path).to eq new_review_path
  #   fill_in "レビュー先URL", with: "https://note.com/shino74/n/nb1038b87ea94"
  #   fill_in "評価", with: 5
  #   fill_in "レビュー", with: "面白い"
  #   click_button "投稿する"
  #   expect(current_path).to eq root_path
  # end
  
  scenario "投稿を削除する" do
    visit edit_note_review_path(Review.last)
    expect(page).to have_content '参考になった'
    # click_link "削除する"
    # expect(current_path).to eq root_path
  end
  
end