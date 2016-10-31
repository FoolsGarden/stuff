class CreateRelation < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :round, index: true
    end
  end
end

