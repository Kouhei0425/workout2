# WORKOUT DB設計

## userテーブル
|Column|Type|Option|
|------|----|------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|

### Asociation
- has_many :articles
- has_many :favorites
- has_many :comments

## articleテーブル
|Column|Type|Option|
|------|----|------|
|content|text|null: false|
|title|string|null: false|
|category|string|null: false|
|image|text||
|user|references|null: false, foreign_key: true|


### Asociation
- belongs_to :user
- has_many :comments
- has_many :favorites


## commentテーブル
|Column|Type|Option|
|------|----|------|
|article|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|text|text|null: false|

### Asociation
- belongs_to :article
- belongs_to :user

## favoriteテーブル
|Column|Type|Option|
|------|----|------|
|user|references|null: false, foreign_key: true|
|article|references|null: false, foreign_key: true|

### Asociation
- belongs_to :user
- belongs_to :articles


