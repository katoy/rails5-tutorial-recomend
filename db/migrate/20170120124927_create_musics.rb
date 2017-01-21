class CreateMusics < ActiveRecord::Migration[5.0]
  def change
    create_table :musics do |t|
      t.string :name
      t.string :player
      t.integer :playtime

      t.timestamps
    end
  end
end
