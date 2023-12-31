class MovementsController < ApplicationController

  def new
    @movement = Movement.new
    @bank_accounts = BankAccount.show_all_banks(current_user)
    @recipients = RecipientAccount.all
    @sidebar = true
    @recipient_account = RecipientAccount.new

    @selected_bank_account = @bank_accounts.first
    @fintoc_accounts = FintocAccount.fintoc_accounts_index(current_user, @selected_bank_account)
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.bank_account = BankAccount.find(params[:movement][:bank_account_id].to_i)
    @movement.currency = "CLP"
    @movement.transaction_date = Time.now.to_date
    @movement.amount = @movement.amount.gsub(/[.]/, '')
    @movement.amount = @movement.amount.to_f
    if @movement.save
      # amountformatted = @movement.amount.to_s.gsub(/[.]/, "")
      bd = BigDecimal(@movement.amount)
      fintoc = FintocAccount.find(@movement.fintoc_account_id)
      balance = fintoc.balance.available
      result = balance - bd
      fintoc.balance.update(available: result)
      redirect_to movement_path(@movement)
    else
      puts @movement.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def movement_confirmation
    redirect_to # pagina de confirmacion
  end

  def index_movements
    @movements = FintocServices.get_movements(account_id, link_token, api_key)
    # Ahora puedes usar @movements en tu vista para mostrar los movimientos de la cuenta
  end

  def show
    @movement = Movement.find(params[:id])
    # @movement_details = FintocServices.get_movement_details(@movement.account_id, @movement.id, link_token, api_key)
    # Aquí, link_token y api_key serían los valores relevantes para el usuario actual.
    @sidebar = true
  end


  private

  def movement_params
    params.require(:movement).permit(:bank_account_id, :fintoc_account_id, :amount, :recipient_account_id, :description)
  end

  def get_movements
    account_id = 'acc_pjGbKqETYAvKrV5E' # Reemplaza con el ID de la cuenta real
    link_token = ENV['FINTOC_LINK_TOKEN']
    api_key = ENV['FINTOC_API_KEY']

    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    account = link.find(id: account_id)

    movements = account.get_movements.to_a
    return movements
    # puts "Movements: #{movements}"
    # guardarlo en @movements
    # una vez guardado en la variable, pasarlo a lo que tengo en la bbdd, su tabla con un each do.
    # y ahi guardarlo en la bbdd
    # y luego mostrarlo en la vista
  end
end
