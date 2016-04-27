class EtiquetasController < ApplicationController
  before_action :load_produto, only: [:create, :destroy]

  def index

    if params[:q]
      @search = Etiqueta.search(params[:q])
    else
      @search = Etiqueta.search(produto_colecao_id_eq: Colecao.first.id)
    end

    @etiquetas = @search.result.includes(produto: :fornecedor).order('etiquetas.gerada, fornecedores.nome, produtos.ref').references(:fornecedor)

    @selected = Etiqueta.selecionadas.in_groups_of(5, false)

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

    pdf = EtiquetasReport.new(Etiqueta.selecionadas)

    Etiqueta.geradas!

    send_data pdf.render, filename: "etiquetas.pdf",
                          type: "application/pdf",
                          disposition: "attachment"


  end

  def select
    @etiqueta = Etiqueta.find(params[:id])
    @etiqueta.mark!

    @selected = Etiqueta.selecionadas.in_groups_of(5, false)
  end

  def unselect
    @etiqueta = Etiqueta.find(params[:id])
    @etiqueta.unmark!

    @selected = Etiqueta.selecionadas.in_groups_of(5, false)
    render :select
  end

  def unselect_all
    Etiqueta.update_all mark: nil
    redirect_to etiquetas_path
  end

  def select_page
    index
    selected = Etiqueta.selecionadas.count
    if selected < 25
      @etiquetas.where(gerada: false).limit(25 - selected).each { |e| e.mark! }
    end
    redirect_to etiquetas_path(params[:q])
  end

 private

  def load_produto
    @produto = Produto.find params[:produto_id] if params[:produto_id]
  end

  def etiq_params
    params.require(:etiqueta).permit(:tamanho_id, :cor_id)
  end

end
