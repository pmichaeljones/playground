class WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def create
    if params[:code] == ENV['CODEWORD']
      word = Word.new(word: params[:word])
      word.save
      flash[:success] = "Your word was added."
    else
      flash[:error] = "Wrong code word!"
    end
    redirect_to words_path

  end

  def create
  end

  def edit
  end

  def destroy
  end


end
