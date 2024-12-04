require 'rails_helper'

RSpec.describe 'ヘッダー・フッター画面遷移', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'ヘッダーアイコン押下時にトップページに遷移する' do
    visit root_path
    click_link 'link-top-page'
    expect(current_path).to eq root_path
    expect(page).to have_content 'ツーリングスポットを探そう！'
  end

  it 'フッターの利用規約押下時に利用規約ページへ遷移し、トップページリンクが正しく設定されている' do
    visit root_path
    click_link 'link-terms-of-service'
    expect(current_path).to eq terms_of_service_path
    expect(page).to have_content 'この利用規約（以下，「本規約」といいます。）'

    click_on 'トップページに戻る'
    expect(current_path).to eq root_path
    expect(page).to have_content 'ツーリングスポットを探そう！'
  end


  it 'フッターのプライバシーポリシー押下時に利用規約ページへ遷移し、トップページリンクが正しく設定されている' do
    visit root_path
    click_on 'プライバシーポリシー'
    expect(current_path).to eq privacy_policy_path
    expect(page).to have_content '「RideFinder」（以下，「本サイト」といいます。）'

    click_on 'トップページに戻る'
    expect(current_path).to eq root_path
    expect(page).to have_content 'ツーリングスポットを探そう！'
  end

  it 'フッターのプライバシーポリシー押下時にプライバシーポリシーページへ遷移し、トップページリンクが正しく設定されている' do
    visit root_path
    click_on 'プライバシーポリシー'

    expect(current_path).to eq privacy_policy_path
    expect(page).to have_content '「RideFinder」（以下，「本サイト」といいます。）'
    click_on 'トップページに戻る'
    expect(current_path).to eq root_path
    expect(page).to have_content 'ツーリングスポットを探そう！'
  end

  it 'フッターのお問い合わせ押下時にお問い合わせページへ遷移する' do
    visit root_path
    click_on 'お問い合わせ'
    expect(current_path).to eq contact_path
    expect(page).to have_content 'お問い合わせフォーム'
  end


  it 'プライバシーポリシーページからお問い合わせページへ遷移' do
    visit privacy_policy_path
    click_link 'link-contact-page'
    expect(current_path).to eq contact_path
    expect(page).to have_content 'お問い合わせフォーム'
  end

  it 'フッターからXアカウントへ遷移' do
    visit root_path
    expect(page).to have_link('link-x-account', href: 'https://x.com/totototo0324')
  end
end

RSpec.describe 'エラーハンドリング', type: :system do
  before do
    driven_by(:rack_test)
  end

  it '存在しないページにアクセスした場合に404ページに遷移する' do
    visit '/nonexistent_path'
    expect(current_path).to eq '/404'
    expect(page.status_code).to eq 404
    expect(page).to have_content 'リクエストに誤り'
    
    click_button 'トップページに戻る'
    expect(current_path).to eq root_path
  end 


end