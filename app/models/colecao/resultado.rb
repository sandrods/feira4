class Colecao::Resultado

  attr_accessor :total, :por_fornecedor

  def initialize(colecao)
    @colecao = colecao
    @total = calcula_total
    @por_fornecedor = calcula_por_fornecedor
  end

  private

  def calcula_total
    total = Dados.new

    total.item_vendidos = ItemEstoque.vendidos.joins(item: :produto)
                                              .where(produtos: { colecao_id: @colecao.id })

    total.compras = @colecao.compras

    total.despesas = @colecao.compras.to_a.sum(&:total) + @colecao.despesas.sum(:valor)
    total.receitas = total.item_vendidos.sum(:valor)

    total
  end

  def calcula_por_fornecedor

    fornecedores.map do |forn|

      d = Dados.new

      d.fornecedor = forn

      d.compras = @colecao.compras.where(fornecedor_id: forn.id)

      d.item_vendidos = ItemEstoque.vendidos.joins(item: :produto)
                                          .where(produtos:
                                                  { colecao_id: @colecao.id,
                                                    fornecedor_id: forn.id })
      d
    end
  end

  def fornecedores
    @colecao.compras.map(&:fornecedor).uniq
  end

  class Dados

    attr_accessor :quantidade_comprados,
                  :receitas,
                  :despesas,
                  :fornecedor,
                  :item_vendidos,
                  :compras


    def quantidade_vendidos
      item_vendidos.count
    end

    def quantidade_comprados
      compras.to_a.sum { |c| c.itens.count }
    end

    def porcent_vendidos
      (quantidade_vendidos.to_f / quantidade_comprados * 100).to_i
    end

    def porcent_receitas
      (receitas.to_f / despesas * 100).to_i
    end

    def vendas_por_tipo
      item_vendidos.group_by { |it| it.item.produto.tipo }
    end

  end

end
