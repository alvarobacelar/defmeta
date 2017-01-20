class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @usuarios = Usuario.all
    respond_with(@usuarios)
  end

  def show
    respond_with(@usuario)
  end

  def new
    @usuario = Usuario.new
    respond_with(@usuario)
  end

  def edit
  end

  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.save
    respond_with(@usuario)
  end

  def update
    # Remove senha quando vazia.
    update_params = usuario_params.dup
    if update_params[:password].empty?
      update_params.delete :password
      update_params.delete :password_confirmation
    end

    @usuario.update(update_params)
    respond_with(@usuario)
  end

  def destroy
    @usuario.destroy
    respond_with(@usuario)
  end

  private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    def usuario_params
      params[:usuario].permit!
    end
end
