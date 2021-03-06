# coding: UTF-8
class TamanhosController < ApplicationController
  before_action :set_tamanho, only: [:show, :edit, :update, :destroy]

  def index
    @search = Tamanho.search(params[:q])
    @tamanhos = @search.result.order(:nome)
  end

  def show
  end

  def new
    @tamanho = Tamanho.new
  end

  def edit
  end

  def create
    @tamanho = Tamanho.new(tamanho_params)

    if @tamanho.save
      redirect_to tamanhos_path, notice: 'Tamanho criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @tamanho.update(tamanho_params)
      redirect_to tamanhos_path, notice: 'Tamanho atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @tamanho.destroy
      redirect_to tamanhos_path, notice: 'Tamanho apagado com sucesso.'
    else
      flash[:error] = "Não foi possível apagar este Tamanho"
      render action: 'edit'
    end
  end

  private
    def set_tamanho
      @tamanho = Tamanho.find(params[:id])
    end

    def tamanho_params
      params.require(:tamanho).permit(:nome)
    end
end
