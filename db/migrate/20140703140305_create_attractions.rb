class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :tickets
      t.integer :min_height
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
