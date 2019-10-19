class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.integer :nausea, default: 0
    t.integer :happiness, default: 0
    t.integer :tickets, default: 0
    t.integer :height, default: 0
    t.boolean :admin, default: false
  end
end
