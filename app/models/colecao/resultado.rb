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

    total.valor_despesas = @colecao.compras.to_a.sum(&:total) + @colecao.despesas.sum(:valor)
    total.valor_receitas = total.item_vendidos.sum(:valor) + @colecao.receitas.sum(:valor)

    @colecao.compras.each do |c|
      total.despesas << { descr: "Compra #{c.fornecedor.nome}", valor: c.total }
    end

    @colecao.despesas.each do |c|
      total.despesas << { descr: c.descricao, valor: c.valor }
    end

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
                  :valor_receitas,
                  :despesas,
                  :valor_despesas,
                  :fornecedor,
                  :item_vendidos,
                  :compras

    def initialize
      @receitas = []
      @despesas = []
    end

    def quantidade_vendidos
      item_vendidos.count
    end

    def quantidade_comprados
      compras.to_a.sum { |c| c.itens.count }
    end

    def porcent_vendidos
      (quantidade_vendidos.to_f / quantidade_comprados * 100).to_i rescue 0
    end

    def porcent_receitas
      (valor_receitas.to_f / valor_despesas * 100).to_i rescue 0
    end

    def vendas_por_tipo
      item_vendidos.group_by { |it| it.item.produto.tipo }.to_a.sort_by { |i| i[1].size }.reverse
    end

  end

end
