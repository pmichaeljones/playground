class FitnesstexterController < ApplicationController

  protect_from_forgery except: :webhook
  #receive webhooks from Stripe and send me emails about payments and stuff
  def webhook
    reason = params["type"]
    customer_id = params["data"]["object"]["customer"]
    ContactMailer.send_stripe_info(customer_id, reason).deliver
    head 200
  end


end
