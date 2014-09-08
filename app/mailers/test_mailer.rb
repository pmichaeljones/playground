class TestMailer < ActionMailer::Base

  def first_email
    mail :subject => "Thanks for emailing me!",
         :to      => "pmichaeljones@gmail.com",
         :from    => "pmichaeljones@gmail.com"

    headers['X-MC-Template'] = "Contact Email Confirmation"
  end

end
