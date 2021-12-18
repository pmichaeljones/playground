class IncreasePrecision < ActiveRecord::Migration
  def change
    change_column :financial_entries, :amount, :decimal, precision: 13, scale: 2
  end
end
