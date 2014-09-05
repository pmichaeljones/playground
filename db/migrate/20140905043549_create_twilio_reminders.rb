class CreateTwilioReminders < ActiveRecord::Migration
  def change
    create_table :twilio_reminders do |t|
      t.string :client, :event
      t.integer :phone_number
      t.timestamps
    end
  end
end
