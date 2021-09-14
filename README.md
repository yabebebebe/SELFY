# アプリケーション名

## selfy

# アプリケーション概要

-  各コンテンツを利用することで、ユーザーの自己効力感向上の手助けのきっかけとなるアプリケーションを作成しました。「成功体験」コンテンツでは、ユーザーの成功体験を投稿、閲覧できます。「褒めちぎり」コンテンツでは、褒めちぎって欲しいことを投稿し、ユーザーからのコメントによって強く前向きな気持ちになれます。「情緒的喚起」コンテンツでは、ユーザーの情緒的喚起に関する内容を投稿、閲覧できます。「My Note」コンテンツでは、自分だけのメッセージ投稿、閲覧ができます。気持ちの整理やメモ書き、好きなことを自由に投稿、一括削除ができます。

# 本番環境

## https://selfy-yb.herokuapp.com/

### テスト用アカウント

- email / yabe@email
- password / yabebe1007
- Basic認証 ID / selfy
- Basic認証 PASS / 7001


# 利用方法

## 投稿方法

- 「成功体験」「褒めちぎり」「情緒的喚起」コンテンツは共通の方法→テストアカウントでログイン→タイトルと内容のフォームを入力→投稿ボタン押下→新規投稿

- 「My Note」コンテンツは共通の方法→テストアカウントでログイン→フォームにメッセージを入力→送信ボタン押下→新規投稿

## 編集方法

- 「成功体験」「褒めちぎり」「情緒的喚起」コンテンツのみで共通の方法→テストアカウントでログイン→投稿の一覧表示の中で自身が投稿したタイトル押下→詳細ページの編集ボタン押下→編集したい内容のフォームを編集し更新ボタン押下→投稿内容編集

## 削除方法

- 「成功体験」「褒めちぎり」「情緒的喚起」コンテンツは共通の方法→テストアカウントでログイン→投稿の一覧表示の中で自身が投稿したタイトル押下→詳細ページの削除ボタン押下→投稿内容削除

- 「My Note」コンテンツ→テストアカウントでログイン→一括削除ボタン押下→投稿内容一括削除

## 退会機能

- テストアカウントでログイン→ヘッダーの退会ボタン押下→最終確認ページの退会するボタン押下→退会（※退会機能は実施しないで下さい）

# 目指した課題解決

- 自身が取得した国家資格キャリアコンサルタントに対する課題解決に関してです。また、様々な悩みを抱える方に対してです。キャリアコンサルタントは、クライアントの持つ多種多様な悩みを聞き、マイナスな気持ちをプラスに導いて行くことは容易ではありません。クライアントは、様々な事情で誰かに直接相談する事自体、ハードルが高く感じる方もいるかもしれません。そこで、気持ちを前向きにする意味を持つ、自己効力感向上の手助けとなるようにしたいと考えました。アプリケーション開発することで、キャリアコンサルタントの負担を減らし、また、対人相談が苦手な方等、どんなユーザーでも手軽に利用しやすい様にしました。

# 要件定義

## ユーザー管理機能

- 目的：登録したユーザーのみアプリの使用ができます

- 詳細：deviseを使用したユーザー管理機能を実装します

- ストーリー：ログイン、ログアウト、新規登録ができるようにします。また、新機能として、物理削除による退会機能を実装します

## コメント機能

- 目的：ユーザーに対して前向きになってもらえるようにコメントをする

- 詳細：投稿に対してコメントができる

- ストーリー：ログイン状態が前提です。送信ボタンをクリックすると、コメント投稿ができる。他のユーザーの投稿の詳細ページにのみコメント投稿フォームが表示される。

## 投稿機能

- 目的：自身の経験や気持ちを共有できます

- 詳細：各コンテンツの新規投稿ができます

- ストーリー：ログイン状態が前提です。投稿ボタンをクリックすると、コンテンツの新規投稿ができます

## 編集機能

- 目的：一度投稿した投稿を編集し、情報を最新のものにすることができます

- 詳細：投稿内容の編集ができます

- ストーリー

## 削除機能

- 目的：場合によって削除できるようにし、ストレスを無くします

- 詳細：投稿内容の削除ができます

- ストーリー：グイン状態が前提です。自身の投稿のみ編集ができます。自身の投稿の詳細ページにのみ編集ボタンが表示されます。

## タブ切替機能

- 目的：ページ遷移を減らしてシンプルにすることで、使いやすくします

- 詳細：各タブをクリックすると表示内容が切り替わります

- ストーリー：ログイン状態が前提です。HTMLとCSSで実装します。タブによって切り替わるビューは、部分テンプレートで分けることで可読性を上げます。タブによって切り替わるビューは、他のタブにリンクするビューが表示されないようにします。


# 実装した機能についての画像やGIF及びその説明

# 開発環境

## バックエンド

### Ruby 2.6.5 / Ruby on Rails 6.0.0

## フロンエンド

### HTML / CSS / JavaScript

## データベース

### MySQL 0.4.4 

## ソース管理

### GitHub / GitHubDesktop

## テスト

### RSpec

## エディタ

### Visual Studio Code

## 実装予定の機能

### いいね機能

- 目的：他ユーザーからいいねをもらうことで自己効力感向上を図る

- 詳細：JavaScriptを使用した非同期通信でのいいね機能

- リロードすることなくいいね数がその場で反映される

### チャット機能

- 目的：リアルタイムチャット機能で、ストレス無くチャットを楽しむことができます

- 詳細：リアルタイムで更新されるチャット機能を実装します

- ストーリー：Action Cableの導入が前提です。メッセージを送信したら、リロードされることなくその場で反映されます

# DMO

## ER図

### [![Image from Gyazo](https://i.gyazo.com/188af095e090147ca1c5eed95a8ba5bd.png)](https://gyazo.com/188af095e090147ca1c5eed95a8ba5bd)

## トップページ

## [![Image from Gyazo](https://i.gyazo.com/faa0f78b562d554edd0c557910ac2dd7.gif)](https://gyazo.com/faa0f78b562d554edd0c557910ac2dd7)

## 

## 

## 工夫した点

- トップページにタブ機能を実装することで、ページ遷移を減らしシンプルな構造にしたことです。タブによる切り替えで各コンテンツの閲覧ができるので、ストレス無く利用できます。これは、実際に知人に普段利用しているアプリケーションでの使い勝手についてヒアリングを実施し、それを元に取り入れました。

## ローカルでの動作方法

### 

# テーブル設計

## usersテーブル

| Colum              | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| birthday           | date    | null: false               |
| phone              | string  | null: false               |

### Association

- has_many   :successes
- has_many   :emotions
- has_many   :messages
- has_many   :notes
- has_many   :comments
- has_many   :likes
- has_many   :like_successes, through: :likes, source: :success
- has_many   :like_emotions, through: :likes, source: :emotion
- has_many   :like_messages, through: :likes, source: :message

## successesテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| title | string     | null: false                    |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## emotionsテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| title | string     | null: false                    |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## messagesテーブル

| Colum | Type       | Options                        |
| ----- | ---------- | ------------------------------ |
| title | string     | null: false                    |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## notesテーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## commentsテーブル

| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :message

## likesテーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| success | references | null: false, foreign_key: true |
| message | references | null: false, foreign_key: true |
| emotion | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :success
- belongs_to :message
- belongs_to :emotion
