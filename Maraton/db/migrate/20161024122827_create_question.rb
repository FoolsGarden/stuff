class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :deck
      t.string :pregunta
      t.string :respuesta
      t.string :opcion_A
      t.string :opcion_B
      t.string :opcion_C
    end
  end
end
