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

  def destroy
    respond_to do |format|
      format.js do 
        @word = Word.find(params[:id])
        @word.delete
      end
    end

  end

  def edit
  end


end
