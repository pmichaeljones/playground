class ChangePhonenumberColumnType < ActiveRecord::Migration
  def change
    change_column :twilio_reminders, :phone_number, :string
  end
end
