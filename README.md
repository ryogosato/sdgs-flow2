# README

## SDGS-FLOW
テーマ：国連が定めた2030年までに達成したい持続可能な開発目標（SDGs）  
  
私たちがSDGsに取り組むことを考え、その活動がどうゆう流れで目標へ繋がるか
記すアプリです。
  
## DEMO
![Image from SDGs-FLOW](https://i.gyazo.com/6329a5c25e1ec21d65b196fe355636b2.jpg)

## Usage
１、ヘッダーの下のGOALSロゴを押して、SDGSの概要を確認します。  

２、トップページから目標を一つ選択します。  

３、動画、具体的目標を閲覧します。  

４、自分が取り組む活動を記述し、目標までの流れを作っていきます。  


※ロゴはガイドライン、動画はチャンネル利用規約に基づいて使用しています。


## Install
```
https://github.com/ryogosato/sdgs-flow2.git

cd sdgs-flow2

rails db:create

rails db:migrate

rails db:seed

rails s
```

## Background
私は、イーロンマスクという人物を尊敬しています。  

彼は、環境を汚さないために電気自動車やソーラーパネルを開発、拡散しています。  

微力ながら彼のように地球をよりよくできる方法はないかと調べSDGsを見つけ  ました。  

これから多数の開発に携わって行く上で、SDGsに関連したシステム、サービス  をリリースしたいと思い、まずはどういう流れで目標へ繋がるか考える機会とし
て本アプリを作成しました。  

## Features
進捗が遅れている国をフォーカスするために各国の目標に対するデータ、統計を確認できる機能を実装したいと思っています。

# DB schema

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||
|content|text||
|youtube_url|string||
### Association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :messages

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|admin|boolean|default: false|
### Association
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :messages