# 概要

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。
このECサイトはDMM WEBCAMP生によるチーム開発課題です。実在するお店のサイトではございませんので、ご了承ください。

## 案件の背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 開発環境
- ruby 3.1.2p20
- Rails 6.1.7.4
- Bootstrap v4.6.2

## 実装した機能
### 顧客側
- 会員登録、ログイン・ログアウト、退会
- 会員情報の編集
- カートへの追加、商品購入
- 支払い方法、配送先の指定
- 配送先の登録、編集
- 注文履歴の閲覧

### 管理者側
- 管理者ログイン
- 会員登録されているユーザ情報の編集、退会処理
- 商品の新規追加、編集
- 商品ジャンルの新規追加、編集
- ユーザの注文履歴閲覧、注文・製作ステータス変更

### 追加機能
- 商品名キーワード検索<br>
- ジャンルごとの商品検索

## 使用方法
```
$ git clone git@github.com:Ib-naganocake/naganocake.git
$ cd naganocake
$ rails db:migrate
$ rails db:seed
$ yarn install
$ bundle install
$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object
$ rails s
```
管理者ログイン方法<br>
URLの後ろに"/admin/sign_in"をつけると管理者ログイン画面へ遷移します。<br>
管理者のメールアドレス・パスワードは以下の通りです。

email: 'admin@admin'<br>
password: '111111'

## チームメンバー
- まさ
- ジョイ
- くま
- ゆり