class TwilioController < ApplicationController
#include Webhookable
require 'twilio-ruby'

  def index
    @texts = IncomingSms.all
  end

  def inbox
    #binding.pry

    sms = IncomingSms.new

    sms.body = params[:Body]

    sms.name = params[:Body].split(" ")[0]
    sms.message = params[:Body].split(" ")[1..-1].join(" ")

    #binding.pry

    sms.save

    #binding.pry

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Thanks for the message #{sms.name}. Please refresh the page to see your message."
      end
    render xml: twiml.text
    #render :index
  end

  def new
  end

  def create
  end

end
