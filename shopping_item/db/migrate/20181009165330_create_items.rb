class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :image
      t.text :address
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
