class FinancialEntriesController < ApplicationController

  def index
    @financial_entries = FinancialEntry.all.order('updated_at DESC')
  end

  def create
    begin
      @financial_entry = FinancialEntry.new(financial_entry_param)

      if @financial_entry.save 
        @financial_entries = FinancialEntry.all.order('updated_at DESC')
      else
        @error_message = "Error: You cannot save that value."
      end
    rescue => e 
      @error_message = "#{e.class}"
    end
  end

  def edit 
    @financial_entry = FinancialEntry.where(id: params[:id]).first

    unless @financial_entry
      redirect_back(fallback_location: root_path) and return
    end
  end

  def update 
    @financial_entry = FinancialEntry.where(id: params[:id]).first

    if @financial_entry.update(financial_entry_param)
      flash[:success] = "Updated successfully!"
    else
      flash[:error] = "Error: Could not update."
    end
    redirect_to financial_entries_path
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