class ChangeMessageTable < ActiveRecord::Migration
  def change
    rename_column :messages, :message, :contents
  end
end
