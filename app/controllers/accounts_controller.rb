class AccountsController < ApplicationController
  def new
    if Account.where(user_id: current_user.id).first
      @account_exists = true
      redirect_to root_path
    else
      @account_exists = false
      @account = Account.new
      @account.stocks.build
    end
  end

  def edit
    @account = Account.where(id: params[:id]).first
  end

  def update
    @account = Account.where(id: params[:id]).first
    if @account.update_attributes(account_params)
      redirect_to root_path
    else
      # render the edit form again
    end
  end

  def create
    @account = current_user.accounts.create(account_params)
    redirect_to root_path if @account.save
  end

  def show
    if Account.where(user_id: current_user.id).first
      @account = Account.where(user_id: current_user.id).first
      @account_1_total = @account.account_1_total
      @account_2_total = @account.account_2_total
      @stock_price = @account.get_stock_data.to_s
      @stock_value = @stock_price.to_f * @account.stocks.first.amount_purchased
      @networth_total = @account_1_total + @account_2_total + @stock_value
      @account_exists = true
    else
      redirect_to new_account_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:account_1_total, :account_2_total, stocks_attributes: %i[id stock_symbol date_purchased amount_purchased])
  end
end
