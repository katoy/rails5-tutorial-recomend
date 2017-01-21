class CreateRecs < ActiveRecord::Migration[5.0]
  def change
    create_table :recs do |t|
      t.integer :order
      t.string :content_type
      t.integer :content_id

      t.timestamps
    end
  end
end
