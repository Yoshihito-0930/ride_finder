require 'rails_helper'

RSpec.describe 'ログイン・ログアウトテスト', type: :system do
  before do
    driven_by(:rack_test)
    SafetyTip.create(content: 'テスト用の交通安全情報')
    visit root_path
  end

  it 'ログインページに遷移' do
    click_button 'ログイン'

    expect(current_path).to eq login_path
    expect(page).to have_content 'アカウントでログイン'
  end
end
