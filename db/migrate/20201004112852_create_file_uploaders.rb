class CreateFileUploaders < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploaders do |t|

      t.timestamps
    end
  end
end
