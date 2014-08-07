class MessagesController < ApplicationController

  def index
  end

  def new
  end

  def create
    #binding.pry
    @message = Message.new(message_params)

    if @message.save
      flash[:notice] = "Thanks for the note!"
      redirect_to root_path
    else
      flash[:notice] = "Your message wasn't valid."
      #binding.pry
      redirect_to root_path
    end

  end

  private

  def message_params
    params.require(:message).permit(:sender, :contents)
  end


end
