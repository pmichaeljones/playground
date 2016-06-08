class ContactMailer < ActionMailer::Base

  def send_stripe_info(customer_id, what_happened)
    @reason = what_happened
    @customer = customer_id
    mail(
      from: "info@boostfitnessmarketing.com",
      to: "info@boostfitnessmarketing.com",
      subject: "Stripe Webhook Update"
      )
  end


  def contact_form_email(obj)
    @message = obj[:message]
    @sender_name = obj[:name]
    @sender_email = obj[:user][:address]

    mail :subject => "Contact Form Submission",
         :to      => "pmichaeljones@gmail.com",
         :from    => "#{obj[:user][:address]}"

    merge_vars =
    {
      "name" => "#{@sender_name}",
      "message" => "#{@message}"
    }

    headers['X-MC-MergeVars'] = merge_vars.to_json

    headers['X-MC-Template'] = "Email To Me"

  end

end
