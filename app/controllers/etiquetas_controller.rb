class EtiquetasController < ApplicationController
  before_action :load_produto, only: [:create, :destroy]

  def index

    if params[:q]
      @search = Etiqueta.search(params[:q])
    else
      @search = Etiqueta.search(produto_colecao_id_eq: Colecao.first.id)
    end

    @etiquetas = @search.result.includes(produto: :fornecedor).order('fornecedores.nome, produtos.ref')

  end

  def create
    quant = params[:quantidade].to_i > 0 ? params[:quantidade].to_i : 1
    quant.times do
      @produto.etiquetas.create!(etiq_params)
    end
  end

  def destroy
    @produto.etiquetas.find(params[:id]).destroy!
  end

  def print
    @etiquetas = Etiqueta.all

    pdf = EtiquetasReport.new(@etiquetas)

    send_data pdf.render, filename: "etiquetas.pdf",
                          type: "application/pdf",
                          disposition: "attachment"

  end

 private

  def load_produto
    @produto = Produto.find params[:produto_id] if params[:produto_id]
  end

  def etiq_params
    params.require(:etiqueta).permit(:tamanho_id, :cor_id)
  end

end
