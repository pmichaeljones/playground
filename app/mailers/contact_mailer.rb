class ContactMailer < ActionMailer::Base

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

    headers['X-MC-Template'] = "Contact Email Confirmation"

  end

end
