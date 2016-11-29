class CreateHouse < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.belongs_to :buliding, index: true
      t.string :tipo
      t.string :piso
      t.integer :numero
      t.integer :recamaras
      t.float :metros
      t.float :precio
      t.string :baños
    end
  end
end
