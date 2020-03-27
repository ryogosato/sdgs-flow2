# README

## SDGS-FLOW
テーマ：国連が定めた2030年までに達成したい持続可能な開発目標（SDGS）  
  
私たちがSDGSに取り組むことを考え、その活動がどうゆう流れで目標へ繋がるか
記すアプリです。
  
## DEMO
![Image from SDGS-FLOW](https://i.gyazo.com/6329a5c25e1ec21d65b196fe355636b2.jpg)

## USAGE
１、ヘッダーの下のGOALSを押して、SDGSの概要を確認します。  
２、トップページから目標を一つ選択します。  
３、動画、具体的目標を閲覧します。  
４、自分が取り組む活動を記述し、目標までの流れを作っていきます。

## INSTALL




## ライセンス

## 作者

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