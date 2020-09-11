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
|  birth_year   |  integer  |  null: false                |
|  birth_month  |  integer  |  null: false                |
|  birth_day    |  integer  |  null: false                |

### Association

- has_many : item
- has_many : address

## items テーブル

|  Column         |  Type        |  Options                           |  
|  -------------- |  ----------- |  --------------------------------- |
|  image          |  string      |  null: false                       |   
|  product_name   |  string      |  null: false,  default: ""         | 
|  explanation    |  text        |  null: false,  default: ""         | 
|  category       |  string      |  null: false                       | 
|  product_status |  string      |  null: false                       | 
|  fee_burden     |  string      |  null: false                       | 
|  shipping_area  |  string      |  null: false                       | 
|  shipping_days  |  string      |  null: false                       |
|  price          |  integer     |  null: false,  default: ""         |
|  user           |  references  |  null: false,  foreign_key: true   |

### Association

- belongs_to : user
- belongs_to : address

## cards テーブル
### Association

## addresses テーブル

|  Column         |  Type       |  Options                          |    
| --------------- |  ---------- |  -------------------------------- |
|  postal_number  |  string     |  null: false,  default: ""        |    
|  prefectures    |  string     |  null: false,                     | 
|  city           |  string     |  null: false,  default: ""        | 
|  address        |  string     |  null: false,  default: ""        | 
|  building_name  |  string     |                default: ""        | 
|  phone_number   |  integer    |  null: false,  default: ""        | 
|  user           |  references |  null: false,  foreign_key: true  | 
|  item           |  references |  null: false,  foreign_key: true  |

### Association

- belongs_to : user
- has_many : item

