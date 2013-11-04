class EtiquetasController < ApplicationController
  before_action :load_produto

  def create
    quant = params[:quantidade].to_i > 0 ? params[:quantidade].to_i : 1
    quant.times do 
      @produto.etiquetas.create!(etiq_params)
    end
  end

  def destroy
    @produto.etiquetas.find(params[:id]).destroy!
  end

 private

  def load_produto
    @produto = Produto.find params[:produto_id] if params[:produto_id]
  end

  def etiq_params
    params.require(:etiqueta).permit(:tamanho_id, :cor_id)
  end

end
