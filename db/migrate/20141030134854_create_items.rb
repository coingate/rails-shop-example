class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title, null: false
      t.decimal :price, null: false, precision: 8, scale: 2

      t.timestamps
    end
  end
end
