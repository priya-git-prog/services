class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news do |t|
      t.string :status
      t.integer :totalResults
      t.jsonb :articles

      t.timestamps
    end
  end
end
