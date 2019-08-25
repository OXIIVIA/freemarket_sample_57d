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
|card_number|integer|null: false, unique: true|
|expire|integer|null: false|
|security_code|integer|null: false|


### Association

- has_many :addresses
- has_many :items, through: :favorites



## addresses

|Column|Type|Options|
|------|----|-------|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|adress|string|null: false|
|building|string| |
|phone_number|integer|unique: true|
|user_id|integer|null: false|


### Association

- belongs_to :user



## favorites

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|


### Association

- belongs_to :user
- belongs_to :item



## items

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postage|boolean|null: false|
|price|integer|null: false|
|group_id|integer|null: false|
|saler_id|integer|null: false|
|buyer_id|integer|null: false|
|brand_id|integer|null: false|
|area_id|integer|null: false|
|delivery_process_id|integer|null: false|
|delivery_date_id|integer|null: false|
|condition_id|integer|null: false|
|size_id|integer|null: false|


### Association

- has_many :users, through: :favorites
- has_many :categories, through: :item_categories
- belongs_to :area
- belongs_to :delivery_date
- belongs_to :delivery_process
- belongs_to :condition
- belongs_to :group
- belongs_to :brand
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"



## areas

|Column|Type|Options|
|------|----|-------|
|area|string|null: false|


### Association

- has_many :items



## delivery_dates

Column|Type|Options|
|------|----|-------|
|date|string|null: false|


### Association

belongs_to :item



## delivery_processes

Column|Type|Options|
|------|----|-------|
|process|string|null: false|


### Association

belongs_to :item



## conditions

Column|Type|Options|
|------|----|-------|
|condition|string|null: false|


### Association

belongs_to :item



## categories

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association

- has_many :items, through: :item_categories
- has_many :sizes, through: :category_sizes



## item_categories

Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|category_id|integer|null: false|


### Association

belongs_to :item
belongs_to :category


## sizes

Column|Type|Options|
|------|----|-------|
|size|string|null: false|


### Association

belongs_to :item



## category_sizes

Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false|
|size_id|integer|null: false|


### Association

belongs_to :category
belongs_to :size



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
|brand_id|integer|null: false|
|group_id|integer|null: false|


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





