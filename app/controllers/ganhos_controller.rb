class GanhosController < ApplicationController
  before_action :set_ganho, only: [:show, :edit, :update, :destroy]

  # GET /ganhos
  # GET /ganhos.json
  def index
    @ganhos = Ganho.all
  end

  # GET /ganhos/1
  # GET /ganhos/1.json
  def show
  end

  # GET /ganhos/new
  def new
    @ganho = Ganho.new
  end

  # GET /ganhos/1/edit
  def edit
  end

  # POST /ganhos
  # POST /ganhos.json
  def create
    @ganho = Ganho.new(ganho_params)

    respond_to do |format|
      if @ganho.save
        format.html { redirect_to ganhos_path, notice: 'Ganho was successfully created.' }
        format.json { render :show, status: :created, location: @ganho }
      else
        format.html { render :new }
        format.json { render json: @ganho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ganhos/1
  # PATCH/PUT /ganhos/1.json
  def update
    respond_to do |format|
      if @ganho.update(ganho_params)
        format.html { redirect_to @ganho, notice: 'Ganho was successfully updated.' }
        format.json { render :show, status: :ok, location: @ganho }
      else
        format.html { render :edit }
        format.json { render json: @ganho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ganhos/1
  # DELETE /ganhos/1.json
  def destroy
    @ganho.destroy
    respond_to do |format|
      format.html { redirect_to ganhos_url, notice: 'Ganho was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ganho
      @ganho = Ganho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ganho_params
      params.require(:ganho).permit(:nome, :valor_ganho, :status)
    end
end
