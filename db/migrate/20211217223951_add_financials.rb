class AddFinancials < ActiveRecord::Migration
  def change
    create_table :financial_entries do |t|
      t.string :name
      t.decimal :amount, precision: 8, scale: 2
      t.timestamps
    end
  end
end
