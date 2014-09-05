class AddMessageStatusToReminders < ActiveRecord::Migration
  def change
    add_column :twilio_reminders, :message_sent, :boolean, default: false
  end
end
