class FinancialEntriesController < ApplicationController

  def index
    @financial_entries = FinancialEntry.all
  end

  def create
    begin
      @financial_entry = FinancialEntry.new(financial_entry_param)

      if @financial_entry.save 
        @financial_entries = FinancialEntry.all
      else
        @error_message = "Error: You cannot save that value."
      end
    rescue => e 
      @error_message = "#{e.class}"
    end
  end

  def destroy
    @financial_entry = FinancialEntry.where(id: params[:id]).first

    if @financial_entry
      @financial_entry.destroy
      @financial_entries = FinancialEntry.all
    else
      @error_message = "Error: You cannot delete that value."
    end

  end

  private

  def financial_entry_param
    params.require(:financial_entry).permit(:name, :amount)
  end

end