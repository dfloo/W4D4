class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
