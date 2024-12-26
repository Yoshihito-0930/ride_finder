require 'rails_helper'

RSpec.describe 'エラーハンドリング', type: :system do
  before do
    driven_by(:rack_test)
  end

  it '存在しないページにアクセスした場合に404ページに遷移する' do
    visit '/nonexistent_path'
    expect(page).to have_content 'リクエストに誤り'

    click_link 'トップページに戻る'
    expect(page).to have_current_path(root_path)
  end
end
