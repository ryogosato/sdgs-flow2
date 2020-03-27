# README

## SDGS-FLOW
テーマ：国連が定めた2030年までに達成したい持続可能な開発目標（SDGS）  
  
私たちがSDGSに取り組むことを考え、その活動がどうゆう流れで目標へ繋がるか
記すアプリです。
  
## DEMO
![Image from SDGS-FLOW](https://i.gyazo.com/6329a5c25e1ec21d65b196fe355636b2.jpg)

## 使い方

## インストール法

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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :groups_users
- has_many :groups, through: :groups_users
- has_many :messages

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|groupname|text|null: false|
|messges_id|integer|null: false, foreign_key: true|
|image|string|
|text|text|
### Association
- has_many :groups_users
- has_many :users, through: :groups_users
- has_many :messages

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group