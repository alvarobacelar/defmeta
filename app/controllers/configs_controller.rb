class ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @configs = Config.all
    respond_with(@configs)
  end

  def show
    respond_with(@config)
  end

  def new
    @config = Config.new
    respond_with(@config)
  end

  def edit
  end

  def create
    @config = Config.new(config_params)
    @config.save
    respond_with(@config, location: configs_path)
  end

  def update
    @config.update(config_params)
    respond_with(@config)
  end

  def destroy
    @config.destroy
    respond_with(@config)
  end

  private
    def set_config
      @config = Config.find(params[:id])
    end

    def config_params
      params.require(:config).permit(:valor_ganho, :valor_dificuldade, :valor_tipo)
    end
end
