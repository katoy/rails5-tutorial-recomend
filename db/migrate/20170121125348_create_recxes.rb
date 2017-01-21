class CreateRecxes < ActiveRecord::Migration[5.0]
  def change
    create_table :recxes do |t|
      t.integer :order

      t.timestamps
    end
  end
end
