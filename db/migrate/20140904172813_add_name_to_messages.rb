class AddNameToMessages < ActiveRecord::Migration
  def change
    add_column :incoming_sms, :name, :string
    add_column :incoming_sms, :message, :string
  end
end
