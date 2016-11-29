class CreateBuilding < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :status
      t.string :fase
    end
  end
end
