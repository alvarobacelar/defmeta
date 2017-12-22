class SistemaslasController < ApplicationController
  before_action :set_sistemasla, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:periodo]
      @mes_referencia = params[:periodo].to_date
    else
      @mes_referencia = Date.today
    end
    # FIXME Acrescentado para evitar bugs nos dias > 28
    #       Deve ser corrigido pois pode afetar o fluxo de caixa do mês
    @mes_referencia = @mes_referencia.change(day: 1)
    @sistemaslas = Sistemasla.all
    respond_with(@sistemaslas)
  end

  def show
    respond_with(@sistemasla)
  end

  def new
    @sistemasla = Sistemasla.new
    respond_with(@sistemasla)
  end

  def edit
  end

  def create
    @sistemasla = Sistemasla.new(sistemasla_params)
    @sistemasla.save
    respond_with(@sistemasla)
  end

  def update
    @sistemasla.update(sistemasla_params)
    respond_with(@sistemasla)
  end

  def destroy
    @sistemasla.destroy
    respond_with(@sistemasla)
  end

  private
    def set_sistemasla
      @sistemasla = Sistemasla.find(params[:id])
    end

    def sistemasla_params
      params.require(:sistemasla).permit(:nome, :slaaceitavel, :descricao, :gruposla_id)
    end
end
