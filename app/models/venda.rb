class Venda < ActiveRecord::Base
  include ClienteOuVendedor

  #has_many :itens, class_name: "ItemVenda", dependent: :destroy
  has_many :itens, -> { where(tipo: 'S') }, class_name: 'ItemEstoque', as: :movimento, dependent: :destroy

  has_many :pagamentos, -> { where(cd: "C").order('data asc') },  class_name: "Registro", as: :registravel

  def self.from_sacola(sacola_id)
    sacola = Sacola.find(sacola_id)

    venda = Venda.create!(data: Date.today, cliente_id: sacola.cliente_id, tipo: sacola.tipo, desconto: 0)

    sacola.itens.incluidos.each { |item_sacola| ItemVenda.create_by_item(item_sacola.item, self) }

    venda
  end

  def adiciona_item!(bc)
    ItemVenda.from_barcode(bc, self)
  end

  def total
    tot = itens.sum(:valor)
    tot = tot * (1 - desconto / 100) if desconto?
    tot
  end

  def desconto?
    desconto.present? && desconto > 0
  end

end
