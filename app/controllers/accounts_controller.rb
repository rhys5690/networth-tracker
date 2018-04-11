class AccountsController < ApplicationController
 def new
   @account = Account.new
 end

 def create
   @account = Account.new(account_params)
   if @account.save
     redirect_to new_account
   else
   end
 end

 private

  def account_params
    params.require(:account).permit(:bank_account_total)
  end
end
