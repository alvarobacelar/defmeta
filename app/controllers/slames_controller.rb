class SlamesController < ApplicationController
  before_action :set_slame, only: [:show, :edit, :update, :destroy]

  respond_to :html
  has_scope :do_periodo

  def index
    if params[:do_periodo]
      @mes_referencia = params[:do_periodo].to_date
    else
      @mes_referencia = Date.today
    end
    # FIXME Acrescentado para evitar bugs nos dias > 28
    #       Deve ser corrigido pois pode afetar o fluxo de caixa do mês
    @mes_referencia = @mes_referencia.change(day: 1)
    data_corrente = Date.today
    params[:do_periodo] = l(data_corrente) unless params[:do_periodo]
    @slames = apply_scopes(Slame).all
    respond_with(@slames)
  end

  def show
    respond_with(@slame)
  end

  def new
    @slame = Slame.new
    if params[:sistemasla_id].present?
      @slame.sistemasla_id = params[:sistemasla_id]
    end
    respond_with(@slame)
  end

  def edit
  end

  def create
    @slame = Slame.new(slame_params)
    @slame.save
    respond_with(@slame, :location => sistemaslas_path)
  end

  def update
    @slame.update(slame_params)
    respond_with(@slame)
  end

  def destroy
    @slame.destroy
    respond_with(@slame)
  end

  private
    def set_slame
      @slame = Slame.find(params[:id])
    end

    def slame_params
      params.require(:slame).permit(:sla, :periodo, :sistemasla_id)
    end
end
