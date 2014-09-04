class CreateSmsDatabase < ActiveRecord::Migration
  def change
    create_table :incoming_sms do |t|
      t.string :body, :from_city, :message_sid, :from_number
      t.timestamps
    end
  end
end
