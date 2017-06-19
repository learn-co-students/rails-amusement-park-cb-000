class CreateAttractions < ActiveRecord::Migration

 def up
   create_table :attractions do |t|
     t.string :name
     t.integer :min_height
     t.integer :nausea_rating
     t.integer :happiness_rating
     t.integer :tickets
   end
 end

 def down
   drop_table :attractions
 end
 
end
