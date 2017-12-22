class GruposlasController < ApplicationController
  before_action :set_gruposla, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @gruposlas = Gruposla.all
    respond_with(@gruposlas)
  end

  def show
    respond_with(@gruposla)
  end

  def new
    @gruposla = Gruposla.new
    respond_with(@gruposla)
  end

  def edit
  end

  def create
    @gruposla = Gruposla.new(gruposla_params)
    @gruposla.save
    respond_with(@gruposla)
  end

  def update
    @gruposla.update(gruposla_params)
    respond_with(@gruposla)
  end

  def destroy
    @gruposla.destroy
    respond_with(@gruposla)
  end

  private
    def set_gruposla
      @gruposla = Gruposla.find(params[:id])
    end

    def gruposla_params
      params.require(:gruposla).permit(:nome, :descricao, :slaaceitavel)
    end
end
