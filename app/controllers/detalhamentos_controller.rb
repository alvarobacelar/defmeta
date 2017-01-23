class DetalhamentosController < ApplicationController
  before_action :set_detalhamento, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @detalhamentos = Detalhamento.all
    respond_with(@detalhamentos)
  end

  def show
    respond_with(@detalhamento)
  end

  def new
    @detalhamento = Detalhamento.new
    respond_with(@detalhamento)
  end

  def edit
  end

  def create
    @detalhamento = Detalhamento.new(detalhamento_params)
    @detalhamento.save
    respond_with(@detalhamento)
  end

  def toogle_status
    @detalhamento = Detalhamento.find(params[:id])
    @detalhamento.update_columns(status: !@detalhamento.status)
    render(nothing: true)
  end

  def update
    @detalhamento.update(detalhamento_params)
    respond_with(@detalhamento)
  end

  def destroy
    @detalhamento.destroy
    respond_with(@detalhamento)
  end

  private
    def set_detalhamento
      @detalhamento = Detalhamento.find(params[:id])
    end

    def detalhamento_params
      params.require(:detalhamento).permit(:item, :meta_id, :status)
    end
end
