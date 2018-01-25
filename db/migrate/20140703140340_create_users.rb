class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.integer :height
      t.integer :nausea
      t.integer :happiness
      t.string  :password_digest
      t.boolean :admin, :default =>  false

      t.timestamps
    end
  end
end
