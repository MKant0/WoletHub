class PaypopupsController < ApplicationController
  before_action :set_paypopup, only: %i[ show edit update destroy ]

  # GET /paypopups or /paypopups.json
  def index
    @paypopups = Paypopup.all
  end

  # GET /paypopups/1 or /paypopups/1.json
  def show
  end

  # GET /paypopups/new
  def new
    @paypopup = Paypopup.new
  end

  # GET /paypopups/1/edit
  def edit
  end

  # POST /paypopups or /paypopups.json
  def create
    @paypopup = Paypopup.new(paypopup_params)

    respond_to do |format|
      if @paypopup.save
        format.html { redirect_to paypopups_url, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @paypopup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paypopup.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paypopups/1 or /paypopups/1.json
  def update
    respond_to do |format|
      if @paypopup.update(paypopup_params)
        format.html { redirect_to paypopups_url, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @paypopup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paypopup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paypopups/1 or /paypopups/1.json
  def destroy
    @paypopup.destroy

    respond_to do |format|
      format.html { redirect_to paypopups_url, notice: "Paypopup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paypopup
      @paypopup = Paypopup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paypopup_params
      params.require(:paypopup).permit(:name, :description)
    end
end
