# coding: UTF-8
class ContasController < ApplicationController
  before_action :set_conta, only: [:show, :edit, :update, :destroy]

  def index
    @search = Conta.search(params[:q])
    @contas = @search.result.order(:nome)
  end

  def show
  end

  def new
    @conta = Conta.new
  end

  def edit
  end

  def create
    @conta = Conta.new(conta_params)

    if @conta.save
      redirect_to contas_path, notice: 'Conta criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @conta.update(conta_params)
      redirect_to contas_path, notice: 'Conta atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @conta.destroy
    redirect_to contas_path, notice: 'Conta apagado com sucesso.'
  end

  private
    def set_conta
      @conta = Conta.find(params[:id])
    end

    def conta_params
      params.require(:conta).permit(:nome)
    end
end
