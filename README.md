
<div align="center"> 

## ![すけっと](https://user-images.githubusercontent.com/73727547/102705713-d093ad00-42cd-11eb-952b-3b1efe3e418e.png)
[「すけっと」へはこちらから](https://suketto2.herokuapp.com/)  
</div>
<br></br>

# 目次
1. [このアプリケーションについて](#このアプリケーションについて)
1. [機能紹介](#機能紹介)
1. [開発環境](#開発環境)
1. [データベース設計](#データベース設計)
1. [接続先情報](#接続先情報)
1. [最後に](#最後に)

<br></br>

# このアプリケーションについて

- 地方で生活をする「おじいちゃん」「おばあちゃん」達は  日常生活の中で農作業等のお手伝いが必要です。

- お手伝い依頼者となる投稿者は動画を撮影し投稿をし  
「すけっと」となる閲覧者は投稿者の元へやり取り後にお手伝いをしに行くだけです。  

- 投稿ページではリアルタイムでやり取りが可能で  
もちろん、「おじいちゃん」「おばあちゃん」同士の交流、助け合いも可能です。  

- 難しいことは一切ない、ちょっと昭和の匂いがするアプリケーションです。  


## [考え]  
- 技術は今後も進化し続けて行きます。  
どんなアプリケーションも便利にすると並行してユーザーが複雑に感じることもあり  
現日本は高齢化先進国であり、地方では多くの生活する「おじいちゃん」「おばあちゃん」がいます。  

- 私が設計し開発中であるこのアプリケーション最大の思いは  
「おじいちゃん」「おばあちゃん」の投稿を子供にあたる世の中の大人達が閲覧した時に何を思うか  
即ち、社会に影響を与えることです。  


## [なぜ福井県版なのか]
- 有名アプリケーションの大半はユーザーが増え、規模が大きくなるにつれ追加で便利にする考え方です。  
「すけっと」は地方にターゲットを絞ったものであって  
「おじいちゃん」「おばあちゃん」の為のものだから、今回は「福井県版」としています。  
<br></br>

# 機能紹介

## [主な機能]
1. ユーザー管理機能(Deviseのカスタマイズを行い実装)
1. 投稿管理機能(ActiveStorageを用いて、動画の投稿も行えるように実装)
1. コメント機能(ActionCableを用いて、リアルタイムで円滑にコミュニケーションを行えるように実装)
1. クレジット決済機能(支払い前にクレジットを登録し、登録後はワンクリックで処理を行えるように実装)
1. ありがとう機能(お手伝い完了後に様子をスライドでトップページに表示出来るように実装)

## [その他機能]
1. アプリケーション内の情報全てを日本語対応に実装
1. トップページ、投稿詳細画面に「すけっと」のガイドリンクを設置
1. Rspec / Rubocopによるテスト機能
<br></br>

# 開発環境

Ruby/RubyonRails/Html/Css/JavaScript/MySQL/Github/VisualStudioCode
<br></br>

# データベース設計

## [ER図]

![suketto_ER](https://user-images.githubusercontent.com/73727547/102718602-59d9cc80-432c-11eb-9d4a-c4838d90fc89.png)
<br></br>

## [テーブル設計]
<br></br>

## [users テーブル]

| Column             | Type    | Options     |
| -------------------| ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birth_date         | date    | null: false |
| area_id            | integer | null: false |
| address            | string  | null: false |
| phone_number       | string  | null: false |


### Association

- has_many :posts
- has_many :comments
- has_many :thanks
- has_one :card

---

## [posts テーブル]

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_many :thanks
- has_one :post_order

---

## [comments テーブル]

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | text       | null: false                    |
| user             | integer    | null: false                    |
| post             | integer    | null: false                    |


### Association

- belongs_to :user
- belongs_to :post

---

## [thanks テーブル]

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | text       | null: false                    |
| user             | integer    | null: false                    |
| post             | integer    | null: false                    |


### Association

- belongs_to :user
- belongs_to :post

---

## [post_ordersテーブル]

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post             | references | null: false, foreign_key: true |


### Association

- belongs_to :post

---
## [cardテーブル]

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user

<br></br>

---
# 接続先情報

## [Basic認証]
[すけっと](https://suketto2.herokuapp.com/)  
ID: suketto  
PW: 1234  
## [テストユーザー等]
依頼者用アカウント  
ID: test1@gmail.com  
PW: 111111a  

すけっと者用アカウント
ID: test2@gmail.com  
PW: 111111a  

依頼者用クレジットカード情報  
カード番号: 4242424242424242  
有効期限: 12/25  
セキュリティコード: 123  

## 動作確認方法
接続先およびログイン情報については、上記の通りです。  
[「すけっとガイド」を閲覧下さい。](https://)  
確認後、ログアウト処理をお願いします。  

<br></br>

--- 
# 最後に
「すけっと」をリリースし、ユーザーを獲得するためには各地域の協力が必要です。  
今回であれば「福井県」の協力を得て、より良いアプリケーションにアップデートすることが中期の目標であり、長期としては地方の教育事業にも携われるものにしていきたいと思っています。

## [今後の実装機能]
1. マイナンバーを利用したユーザー管理機能
1. ふるさと納税を利用したユーザー還元サービス
1. レスポンシブ対応
1. 本番環境適応（AWS(EC2 , S3)/Unicorn/Nginx/MySQL/Capistrano）
<br></br>