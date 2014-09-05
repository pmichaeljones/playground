class TwilioReminder < ActiveRecord::Base

  validates :client, presence: true
  validates :event, presence: true

  validates :phone_number, presence: true
  validates :phone_number, length: { is: 12, message: "must be styled like: 555-555-5555" }
end
