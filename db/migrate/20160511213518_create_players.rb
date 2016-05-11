class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, limit: 100, null: false
      t.integer :steam_id
      t.timestamps null: false
    end
  end
end
