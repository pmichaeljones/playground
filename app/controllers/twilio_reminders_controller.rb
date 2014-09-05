class TwilioRemindersController < ApplicationController

  def index
    @reminders = TwilioReminder.all
    @twilio_reminder = TwilioReminder.new
  end

  def create
    @twilio_reminder = TwilioReminder.new



    render :index
  end

  def send_reminder
    binding.pry
  end



end
