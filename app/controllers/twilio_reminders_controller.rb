class TwilioRemindersController < ApplicationController
require 'twilio-ruby'

  def index
    #@reminder = TwilioReminder.new
    @reminders = TwilioReminder.all
    @twilio_reminder = TwilioReminder.new
  end

  def create
    #binding.pry
    @reminders = TwilioReminder.all
    @twilio_reminder = TwilioReminder.new(message_params)

    #binding.pry

    if @twilio_reminder.save
      redirect_to twilio_reminders_path
    else
      #flash.now[:error] = "Something went wrong with your inputs."
      #binding.pry
      render :index
    end

  end

  def send_reminder
    #binding.pry

    reminder = TwilioReminder.find(params[:id])

    user_phone_number = reminder.phone_number.remove("-").prepend("+1")

    @client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_TOKEN"]

    message = @client.account.messages.create(
      :body => "Patrick's Twilio App: Hi #{reminder.client}. Your #{reminder.event} is ready for pickup. Do not reply to this message.",
      :to => "#{user_phone_number}",
      :from => "+17208973141"
      )

    message.to

    patrick_message = @client.account.messages.create(
      :body => "Someone just used your SMS API. Congrat-u-fucking-lations!",
      :to => "+16124379264",
      :from => "+17208973141"
      )

    patrick_message.to

    reminder.message_sent = true

    reminder.save

    #binding.pry

    redirect_to twilio_reminders_path

  end

  def delete_reminder

    #binding.pry

    reminder = TwilioReminder.find(params[:id])

    reminder.delete

    redirect_to twilio_reminders_path

  end


  private

  def message_params
    params.require(:twilio_reminder).permit(:client, :event, :phone_number)
  end


end
