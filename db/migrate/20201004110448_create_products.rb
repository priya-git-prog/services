class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :material_code
      t.string :product_category_code
      t.boolean :status

      t.timestamps
    end
  end
end
