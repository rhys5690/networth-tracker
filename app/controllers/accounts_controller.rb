class AccountsController < ApplicationController
 def new
   if Account.where(user_id: current_user.id).first
     redirect_to root_path
   else
     @account = Account.new
   end
 end

 def create
   @account = current_user.accounts.create(account_params)
   if @account.save
     redirect_to root_path
   else
   end
 end

 def show
   @account_1_total = Account.where(user_id: current_user.id).first.account_1_total
   @account_2_total = Account.where(user_id: current_user.id).first.account_2_total
   @bank_account_total = @account_1_total + @account_2_total

 end

 private

  def account_params
    params.require(:account).permit(:account_1_total, :account_2_total)
  end
end
