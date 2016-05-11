class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name, limit: 100, null: false
      t.integer :dota_id, null: false
      t.string :image_url

      t.timestamps null: false
    end
  end
end
