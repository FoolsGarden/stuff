class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user
      t.integer :deck
      t.integer :right
      t.integer :wrong 
    end
  end
end
