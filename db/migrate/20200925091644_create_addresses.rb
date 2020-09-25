class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string                 :postal_number      , null: false, defaurt: ""
      t.integer                :prefecture_id      , null: false
      t.string                 :city               , null: false, defaurt: ""
      t.string                 :address            , null: false, defaurt: ""
      t.string                 :building_name      , defaurt: ""
      t.string                 :phone_number       , null: false, defaurt: ""
      t.references             :order              , foreign_key: true
      t.timestamps
    end
  end
end
