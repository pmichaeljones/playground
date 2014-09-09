class ContactFormController < ApplicationController

  def new
  end

  def create
    #binding.pry
    @obj = params

    ContactMailer.contact_form_email(@obj).deliver

    flash[:notice] = "Thanks for the email!"

    redirect_to contact_form_index_path
  end

end
