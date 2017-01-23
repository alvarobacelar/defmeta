class MetasController < ApplicationController
  before_action :set_meta, only: [:show, :edit, :detalhar, :update, :destroy]

  respond_to :html
  has_scope :periodo
  has_scope :com_responsavel


  def index
    if params[:periodo]
      @mes_referencia = params[:periodo].to_date
    else
      @mes_referencia = Date.today
    end
    # FIXME Acrescentado para evitar bugs nos dias > 28
    #       Deve ser corrigido pois pode afetar o fluxo de caixa do mês
    @mes_referencia = @mes_referencia.change(day: 1)
    data_corrente = Date.today
    params[:periodo] = l(data_corrente) unless params[:periodo]
    @metas = apply_scopes(Meta).all.order('pontuacao DESC')
    respond_with(@metas)
  end

  def show
    respond_with(@meta)
  end

  def detalhar

  end

  def new
    @meta = Meta.new
    respond_with(@meta)
  end

  def edit
  end

  def create
    @meta = Meta.new(meta_params)
    @meta.save
    respond_with(@meta)
  end

  def update
    @meta.update(meta_params)
    respond_with(@meta)
  end

  def destroy
    @meta.destroy
    respond_with(@meta)
  end

  private
    def set_meta
      @meta = Meta.find(params[:id])
    end

    def meta_params
      params.require(:meta).permit(:nome, :tipo_id, :dificuldade_id, :ganho_id, :usuario_id, :datameta,
      detalhamentos_attributes: [:id, :item, :meta_id, :_destroy])
    end
end
