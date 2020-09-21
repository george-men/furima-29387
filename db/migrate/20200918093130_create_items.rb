class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :product_name      , null: false, defaurt: ""
      t.text         :explanation       , null: false, defaurt: ""
      t.integer      :category_id       , null: false
      t.integer      :product_status_id , null: false
      t.integer      :fee_burden_id     , null: false
      t.integer      :shipping_area_id  , null: false
      t.integer      :shipping_days_id  , null: false
      t.integer      :price             , null: false, defaurt: ""
      t.references   :user              , foreign_key: true 
      t.timestamps   
    end
  end
end
