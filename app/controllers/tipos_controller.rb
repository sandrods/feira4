# coding: UTF-8
class TiposController < ApplicationController
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]

  def index
    @search = Tipo.search(params[:q])
    @tipos = @search.result.order(:descricao)
  end

  def show
  end

  def new
    @tipo = Tipo.new
  end

  def edit
  end

  def create
    @tipo = Tipo.new(tipo_params)

    if @tipo.save
      redirect_to tipos_path, notice: 'Tipo criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @tipo.update(tipo_params)
      redirect_to tipos_path, notice: 'Tipo atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @tipo.destroy
      redirect_to tipos_path, notice: 'Tipo apagado com sucesso.'
    else
      flash[:error] = "Não foi possível apagar este Tipo"
      render action: 'edit'
    end
  end

  private
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    def tipo_params
      params.require(:tipo).permit(:descricao)
    end
end
