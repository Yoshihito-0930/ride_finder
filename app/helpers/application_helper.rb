module ApplicationHelper
  # OGP静的表示する場合に利用 (現在未使用)
  def default_meta_tags
    {
      site: 'Ride finder',
      title: 'Ride Finder',
      reverse: true,
      charset: 'utf-8',
      description: 'ツーリングスポットを見つけるアプリです',
      canonical: request.original_url,
      og: {
        site_name: 'Ride finder',
        title: 'Ride finder',
        description: 'ツーリングスポットを見つけることを目的としたアプリです',
        type: 'website',
        url: request.original_url,
        image: image_url('default_share.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@https://x.com/totototo0324',
        image: image_url('default_share.png')
      }
    }
  end
end
