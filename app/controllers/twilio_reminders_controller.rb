class TwilioRemindersController < ApplicationController
require 'twilio-ruby'

  def index
    @reminders = TwilioReminder.all
    @twilio_reminder = TwilioReminder.new
  end

  def create
    @twilio_reminder = TwilioReminder.new



    render :index
  end

  def send_reminder
    #binding.pry

    reminder = TwilioReminder.find(params[:id])


    @client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]

    message = @client.account.messages.create(
      :body => "Hi #{reminder.client}. Your #{reminder.event} is ready for pickup",
      :to => "+16124379264",
      :from => "+17208973141"
      )

    message.to

    redirect_to twilio_reminders_path

  end



end
