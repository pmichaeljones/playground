class AddWordsTable < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word 
      t.timestamps
    end
  end
end