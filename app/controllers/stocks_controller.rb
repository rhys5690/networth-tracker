class StocksController < ApplicationController
  def create
    @stock = @account = current_user.accounts.create(account_params).stocks
  end

  private

   def stock_params
     params.require(:stock).permit(:stock_symbol, :date_purchased, :amount_purchased)
   end
end
