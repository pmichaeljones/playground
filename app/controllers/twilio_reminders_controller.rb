class TwilioRemindersController < ApplicationController

  def index
    @twilio_reminder = TwilioReminder.new
  end

end
