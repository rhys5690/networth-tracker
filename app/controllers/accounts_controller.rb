class AccountsController < ApplicationController
 def new
   @account = Account.new
 end

 def create
   @account = current_user.accounts.create(account_params)
 end

 private

  def account_params
    params.require(:account).permit(:bank_account_total)
  end
end
