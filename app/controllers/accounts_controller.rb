class AccountsController < ApplicationController
 def new
   @account = Account.new
 end

 def create
   @account = current_user.accounts.create(account_params)
   if @account.save
     redirect_to root_path
   else
   end
 end

 def show
   @bank_account_total = Account.where(user_id: current_user.id).first.bank_account_total
 end

 private

  def account_params
    params.require(:account).permit(:bank_account_total)
  end
end
