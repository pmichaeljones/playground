class ContactMailer < ActionMailer::Base

  def contact_form_email(obj)
    @message = obj[:message]
    @sender_name = obj[:name]
    @sender_email = obj[:user][:address]
    @subject = obj[:subject]

    mail :subject => "Contact Form Submission",
         :to      => "pmichaeljones@gmail.com",
         :from    => "#{obj[:user][:address]}"

    # headers['X-MC-Template'] = "Contact Email Confirmation"
  end

end
