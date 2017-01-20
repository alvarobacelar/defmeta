class DificuldadesController < ApplicationController
  before_action :set_dificuldade, only: [:show, :edit, :update, :destroy]

  # GET /dificuldades
  # GET /dificuldades.json
  def index
    @dificuldades = Dificuldade.all
  end

  # GET /dificuldades/1
  # GET /dificuldades/1.json
  def show
  end

  # GET /dificuldades/new
  def new
    @dificuldade = Dificuldade.new
  end

  # GET /dificuldades/1/edit
  def edit
  end

  # POST /dificuldades
  # POST /dificuldades.json
  def create
    @dificuldade = Dificuldade.new(dificuldade_params)

    respond_to do |format|
      if @dificuldade.save
        format.html { redirect_to @dificuldade, notice: 'Dificuldade was successfully created.' }
        format.json { render :show, status: :created, location: @dificuldade }
      else
        format.html { render :new }
        format.json { render json: @dificuldade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dificuldades/1
  # PATCH/PUT /dificuldades/1.json
  def update
    respond_to do |format|
      if @dificuldade.update(dificuldade_params)
        format.html { redirect_to @dificuldade, notice: 'Dificuldade was successfully updated.' }
        format.json { render :show, status: :ok, location: @dificuldade }
      else
        format.html { render :edit }
        format.json { render json: @dificuldade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dificuldades/1
  # DELETE /dificuldades/1.json
  def destroy
    @dificuldade.destroy
    respond_to do |format|
      format.html { redirect_to dificuldades_url, notice: 'Dificuldade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dificuldade
      @dificuldade = Dificuldade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dificuldade_params
      params.require(:dificuldade).permit(:nome, :valor_dificuldade, :status)
    end
end
