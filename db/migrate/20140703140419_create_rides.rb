class CreateRides < ActiveRecord::Migration

  def up
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id
    end
  end

  def down
    drop_table :rides
  end
  
end
