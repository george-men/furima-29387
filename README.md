# テーブル設計
## 正規表現については各機能実装時に注意して実施
## カード情報はPAY.JPへのトークン情報のためテーブルは作成しない

## users テーブル

|  Column       |  Type     |  Options                    |    
|  ------------ |  -------- |  -------------------------- |    
|  nickname     |  string   |  null: false,  default: ""  |      
|  email        |  string   |  null: false,  default: ""  | 
|  password     |  string   |  null: false,  default: ""  | 
|  family_name  |  string   |  null: false,  default: ""  | 
|  first_name   |  string   |  null: false,  default: ""  | 
|  fam_reading  |  string   |  null: false,  default: ""  | 
|  fir_reading  |  string   |  null: false,  default: ""  | 
|  birth_date   |  date     |  null: false                |

### Association

- has_many : items
- has_many : orders

## items テーブル

|  Column            |  Type        |  Options                           |  
|  ----------------- |  ----------- |  --------------------------------- |  
|  product_name      |  string      |  null: false,  default: ""         | 
|  explanation       |  text        |  null: false,  default: ""         | 
|  category_id       |  integer     |  null: false                       | 
|  product_status_id |  integer     |  null: false                       | 
|  fee_burden_id     |  integer     |  null: false                       | 
|  shipping_area_id  |  integer     |  null: false                       | 
|  shipping_days_id  |  integer     |  null: false                       |
|  price             |  integer     |  null: false,  default: ""         |
|  user              |  references  |  null: false,  foreign_key: true   |

### Association

- belongs_to : user
- has_one : order

## addresses テーブル

|  Column         |  Type       |  Options                          |    
| --------------- |  ---------- |  -------------------------------- |
|  postal_number  |  string     |  null: false,  default: ""        |    
|  prefecture_id  |  integer    |  null: false,                     | 
|  city           |  string     |  null: false,  default: ""        | 
|  address        |  string     |  null: false,  default: ""        | 
|  building_name  |  string     |                default: ""        | 
|  phone_number   |  string     |  null: false,  default: ""        | 
|  order          |  references |  null: false,  foreign_key: true  |

### Association

- belongs_to : order

## orders テーブル

|  Column         |  Type       |  Options                          |    
| --------------- |  ---------- |  -------------------------------- |
|  user           |  references |  null: false,  foreign_key: true  | 
|  item           |  references |  null: false,  foreign_key: true  |


### Association

- belongs_to : user
- belongs_to : item
- has_one : addresse
