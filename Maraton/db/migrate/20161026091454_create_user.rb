class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :total_rounds
      t.integer :total_score
    end
  end
end
