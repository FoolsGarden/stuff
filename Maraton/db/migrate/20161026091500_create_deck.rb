class CreateDeck < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :category
    end
  end
end
