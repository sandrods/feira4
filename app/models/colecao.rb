class Colecao < ActiveRecord::Base

  default_scope -> { order('id desc') }

  has_many :despesas, -> { where(cd: "D").order('data asc') },  class_name: "Registro"
  has_many :receitas, -> { where(cd: "C").order('data asc') },  class_name: "Registro"

  has_many :compras

  def Colecao.to_select
    Colecao.all.map {|c| [c.descricao, c.id]}
  end

  def quantidade_item_comprados
    @quantidade_item_comprados ||= compras.to_a.sum { |c| c.itens.count }
  end

  def quantidade_item_vendidos
    @quantidade_item_vendidos ||= item_vendidos.count
  end

  def total_despesas
    @total_despesas ||= compras.to_a.sum(&:total) + despesas.sum(:valor)
  end

  def total_receitas
    @total_receitas ||= item_vendidos.sum(:valor)
  end

  def porcent_vendidos
    (quantidade_item_vendidos.to_f / quantidade_item_comprados * 100).to_i
  end

  def porcent_receitas
    (total_receitas.to_f / total_despesas * 100).to_i
  end

  def item_vendidos
    ItemEstoque.vendidos.joins(item: :produto).where( produtos: { colecao_id: self.id })
  end

end
