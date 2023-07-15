class RecipientAccountsController < ApplicationController

  def new
    @recipieint_account = RecipientAccount.new
  end

  def create
    @recipient_account = RecipientAccount.new(recipient_account_params)
    if @recipient_account.save
      favorite_recipient_account = FavoriteRecipientAccount.create(user: current_user, recipient_account: @recipient_account)
      if favorite_recipient_account.persisted?
        redirect_to new_movement_path
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def recipient_account_params
    params.require(:recipient_account).permit(:holder_id, :holder_name, :number, :institution)
  end
end
