class CreateRecfs < ActiveRecord::Migration[5.0]
  def change
    create_table :recfs do |t|
      t.integer :order, null: false, default: 1
      t.integer :content_type, null: false, default: 1
      t.boolean :fixed_flag, default: false
      t.integer :fixed_id,   default: nil

      t.timestamps
    end
  end
end
