class CreateMaxims < ActiveRecord::Migration
  def change
    create_table :maxims do |t|
      t.string :word
      t.string :author
      t.string :img_path

      t.timestamps null: false
    end
  end
end
