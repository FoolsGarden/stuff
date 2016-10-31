class CreateRound < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :ronda
      t.integer :winner
    end
  end
end
