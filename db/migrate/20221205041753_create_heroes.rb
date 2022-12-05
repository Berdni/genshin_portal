class CreateHeroes < ActiveRecord::Migration[7.0]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :slug
      t.string :rarity
      t.string :element
      t.jsonb :icon_data

      t.timestamps
    end
    add_index :heroes, :slug, unique: true
  end
end
