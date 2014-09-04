class TwilioController < ApplicationController
#include Webhookable
require 'twilio-ruby'

  def index
    @texts = IncomingSms.all
  end

  def inbox
    #binding.pry

    message = IncomingSms.new

    message.body = params[:Body]
    message.from_city = params[:FromCity]
    message.from_number = params[:From]

    #binding.pry

    message.save

    #binding.pry

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Thanks for the message #{params[:Body]}. To go https://pmichaeljones.herokuapp.com/twilio to see your message."
      end
    render xml: twiml.text
    #render :index
  end

  def new
  end

  def create
  end

end
