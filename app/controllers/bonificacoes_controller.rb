class BonificacoesController < ApplicationController
  before_action :set_bonificacao, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bonificacoes = Bonificacao.all
    respond_with(@bonificacoes)
  end

  def show
    # respond_with(@bonificacao)
    respond_to do |format|
      format.html 
      format.csv { send_data @bonificacao.to_csv }
      format.xls
    end
  end

  def new
    @bonificacao = Bonificacao.new
    respond_with(@bonificacao)
  end

  def edit
  end

  def create
    @bonificacao = Bonificacao.new(bonificacao_params)
    @bonificacao.save
    respond_with(@bonificacao)
  end

  def update
    @bonificacao.update(bonificacao_params)
    respond_with(@bonificacao)
  end

  def destroy
    @bonificacao.destroy
    respond_with(@bonificacao)
  end

  private
    def set_bonificacao
      @bonificacao = Bonificacao.find(params[:id])
    end

    def bonificacao_params
      params.require(:bonificacao).permit(:quantidaden3, :quantidaden2, :quantidaden1, :alcancadon3, :alcancadon2, :alcancadon1, :totalalcancado, :bnfalcancadan3, :bnfalcancadan2, :bnfalcancadan1, :totalbnf, :pontuacaon3, :pontuacaon2, :pontuacaon1, :totalpontuacao, :pontuacaodonen3, :pontuacaodonen2, :pontuacaodonen1, :totalpontuacaodone)
    end
end
