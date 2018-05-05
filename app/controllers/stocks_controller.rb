class StocksController < ApplicationController
  def create
    @stock = current_user.stocks.create(stocks_params)
  end

  private

   def stock_params
     params.require(:stock).permit(:stock_symbol, :date_purchased, :amount_purchased)
   end
end
