module SearchMacros
  def search
    visit root_path
    click_button 'ツーリングスポットを探す'
    select '観光名所', from: 'カテゴリー'
    select '距離', from: '条件'
    select '30km以内', from: '探す範囲'
    click_button '検索'
  end
end