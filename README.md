## users

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|image|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|birthdate|integer|null: false|
|profile|text| |



### Association

- has_one :address
- has_one :card
- has_many :favorites



##card

|card_number|integer|null: false, unique: true|
|expire|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user



## address

|Column|Type|Options|
|------|----|-------|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building|string| |
|phone_number|integer|unique: true|
|user_id|integer|null: false, foreign_key: true|


### Association

- belongs_to :user



## favorites

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|


### Association

- belongs_to :user
- belongs_to :item



## items

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postage|boolean|null: false|
|price|integer|null: false|
|condition|string|null: false|
|size|string|null: false|
|group_id|integer|null: false,foreign_key: true|
|saler_id|integer|null: false,foreign_key: true|
|buyer_id|integer|null: false,foreign_key: true|
|brand_id|integer|null: false,foreign_key: true|



### Association

- has_one :delivery
- has_many :favorites
- has_many :categories, through: :item_categories
- belongs_to :group
- belongs_to :brand
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"



## delivery

|Column|Type|Options|
|------|----|-------|
|area|string|null: false|
|date|string|null: false|
|process|string|null: false|
|item_id|integer|null: false,foreign_key: true|

### Association

belongs_to :item



## categories

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association

- has_many :items, through: :item_categories



## item_categories

Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false,foreign_key: true|
|category_id|integer|null: false,foreign_key: true|


### Association

belongs_to :item
belongs_to :category



## brands

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association

- has_many :items
- has_many :groups, through: :brand_groups



## brand_groups

Column|Type|Options|
|------|----|-------|
|brand_id|integer|null: false,foreign_key: true|
|group_id|integer|null: false,foreign_key: true|


### Association

- belongs_to :brand
- belongs_to :group



## groups

Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association

- has_many :items
- has_many :brands, through: :brand_groups





