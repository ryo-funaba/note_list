require 'rails_helper'

RSpec.describe 'レビュー', type: :feature  do
  before do
    @user = User.create!(nickname: 'ユーザーA', email: 'a@example.com', password: 'password')
      # let(:review_a) { FactoryBot.create(:review, url: 'test_url_1', user: user_a) }
  end

  it do
    visit new_user_session_path
    fill_in 'メールアドレス', with: '@user.email'
    fill_in 'password', with: '@user.password'
    click_button 'ログイン'
    visit root_path
    expect(page).to have_content 'ログイン'
  end
    
  # describe 'ログイン' do
  #   let(:login_user) {user_a}
  #   it 'ができたか確認' do
  #     visit root_path
  #     expect(page).to have_content 'サインアウト'
  #   end
  # end
  
end