# ■サービス名
### **Ride finder**   
サービスURL: https://ride-finder.com  
<img src=https://i.gyazo.com/c1c780894d988f3f1bb9dc9975599ce7.png width=480>  

# ■サービス概要  
『Ride finder』はバイク乗りの方向けに位置情報を使ってツーリングスポットを検索出来るサービスです。  
景勝地や観光名所などの「カテゴリ」と「距離・時間」を指定すると現在地から行けるツーリングスポットが見つかります。

# ■ このサービスへの思い・作りたい理由  
私はバイクでツーリングをするのがとても好きで、ツーリングスポットを探す際、以下の手段を活用していました。  
- ブログやSNS、Googleマップ等で検索して探す
- 知り合いやカフェで聞く
- ツーリングマップル等書籍で探す

上記の複数のサービスを跨いでツーリングスポットを探して、Googleマップでツーリングスポットを保存して後日バイクで行っていました。
ただ、同じバイク乗りである父や父親の友達は検索能力が低く、ネットの扱いも上手くないため上手にネットを活用してツーリングスポットを探せていませんでした。
別のケースでは友人と旅先で明日どこ行くかで迷い、時間を割いてツーリング先を決める事もありました。
これらの問題を解決したいと思い、誰でも扱えるツーリングスポットを「探す」「保存する」を一つにまとまったサービスを作りたいと思い制作にいたりました。  

# ■ ユーザー層について  
バイク乗りの方を中心に以下のユーザー向けになります  
- ツーリングスポットを探したい方・探すのが苦手な方
- 同じ場所ばかり行ってしまい飽きてしまった方
- 距離または時間で行き先を決めたい方 

# ■サービスの利用イメージ  
ツーリングスポットを「探す」「保存する」を一つにまとめたサービスになります。  
複数のサービスを跨がる手間を無くします。

# ■ 機能紹介

|ユーザー登録/ログイン|
| ---- |
|[![Image from Gyazo](https://i.gyazo.com/7f7044056c4c8b0b30c5ce31b637181e.gif)](https://gyazo.com/7f7044056c4c8b0b30c5ce31b637181e)|
| ユーザー登録及びログインがGoogleアカウントもしくはLINEアカウントでIDやパスワードを覚える必要も無く簡単に出来ます。 |

|ツーリングスポット検索　|
| ---- |
|[![Image from Gyazo](https://i.gyazo.com/4b5c8978a513e67d5ab992aa3c13073b.gif)](https://gyazo.com/4b5c8978a513e67d5ab992aa3c13073b)|
| 機能説明 |

|ツーリングスポットの詳細表示　|
| ---- |
|[![Image from Gyazo](https://i.gyazo.com/4b5c8978a513e67d5ab992aa3c13073b.gif)](https://gyazo.com/4b5c8978a513e67d5ab992aa3c13073b)|
| 気になるツーリングスポットの詳細ページには、現在地からのルートやストリートビュー等 |

|　|
| ---- |
|[![Image from Gyazo](https://i.gyazo.com/4b5c8978a513e67d5ab992aa3c13073b.gif)](https://gyazo.com/4b5c8978a513e67d5ab992aa3c13073b)|
| 機能説明 |

|お気に入り/後で行きたい　|
| ---- |
|[![Image from Gyazo](https://i.gyazo.com/4b5c8978a513e67d5ab992aa3c13073b.gif)](https://gyazo.com/4b5c8978a513e67d5ab992aa3c13073b)|
| 機能説明 |

|AIによる交通安全情報の発信|
| ---- |
[![Image from Gyazo](https://i.gyazo.com/69bb2eb7fdf3c70af70489fbbebe23ff.png)](https://gyazo.com/69bb2eb7fdf3c70af70489fbbebe23ff)
| トップページ上部にGemini AIによって生成したバイクの交通安全情報が毎日発信されます |



# ■ サービスの差別化ポイント・推しポイント
- 類似のサービスとして以下のサービスがあります。
  - Googleマップ
  - [ツーリングサポーター(有料)](https://play.google.com/store/apps/details?id=com.navitime.local.bike&hl=ja&gl=US&pli=1)

上記のサービスとの差別化として下記のサービスがあります。
- 行きたい場所のカテゴリを決めて検索(峠、展望所、道の駅、キャンプ場等バイク乗りによって乗る目的が分かれているため)
- 走りたい距離または時間で検索（何キロ以上、何分以上等）

# ■ 機能
- MVP
  - OAuthを使ったLINE・Googleログイン機能
  - マップ表示(Google Maps APIを利用)
  - 候補地検索機能(Places API)
  - 現在地の取得(Geolocation API)
  - 候補地の住所、評価等取得(Places API)
  - 条件検索機能(カテゴリや距離・時間の指定)
  - お問い合わせ(googleフォーム)・利用規約・プライバシーポリシーの作成
 
- 本リリース
  - ロケーション保存機能(後で行きたい場所を保存)
  - ブックマーク機能
  - 上記機能の追加削除のAjax化
  - X(旧Twitter)へのシェア機能(静的OGP)
  - 経路情報表示機能
  - ストリートビューの表示(Google Maps JavaScript API)
  - ルート情報取得機能(有料道路・有料区間回避ルート・下道の所要時間と距離の取得)
  - 独自ドメイン取得
  - テスト機能(RubocopによるLintチェック,RSpecによるモデルチェック)
  - Gemini AIによる交通安全情報の発信
  
# ■ 機能の実装方針予定
- 実装予定機能
  - 通知機能(サービスを継続的に使ってもらえるようにメールまたはLINE Messaging APIで保存したロケーションを通知)
 

# ■ 使用技術
| カテゴリ | 技術内容 |
| ---- | ---- |
| サーバーサイド | Ruby:3.2.3 / Ruby on Rails:7.0.8 |
| フロントエンド | HTML / CSS / JavaScript |
| CSSフレームワーク | Tailwind CSS / daisyUI |
| Web API | Maps JavaScript API / Places API / Geolocation API / LineログインAPI / Google ログイン API / Gemini API |
| データベース | PostgreSQL |
| インフラ | Fly.io / Amazon S3 |
| CI/CD | Github |
| 認証 | OmniAuth |
| 環境構築 | Docker |



# ■ ER図
[![Image from Gyazo](https://i.gyazo.com/6737c86e223b4c252f61210ee25dcce0.png)](https://gyazo.com/6737c86e223b4c252f61210ee25dcce0)
