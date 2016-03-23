# coding: UTF-8
class FormasController < ApplicationController
  before_action :set_forma, only: [:show, :edit, :update, :destroy]

  def index
    @formas = Forma.order(:nome)
  end

  def show
  end

  def new
    @forma = Forma.new
  end

  def edit
  end

  def create
    @forma = Forma.new(forma_params)

    if @forma.save
      redirect_to formas_path, notice: 'Forma criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @forma.update(forma_params)
      redirect_to formas_path, notice: 'Forma atualizada com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @forma.destroy
    redirect_to formas_path, notice: 'Forma apagada com sucesso.'
  end

  private
    def set_forma
      @forma = Forma.find(params[:id])
    end

    def forma_params
      params.require(:forma).permit(:nome, :conta_id)
    end
end
