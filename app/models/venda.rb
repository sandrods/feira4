class Venda < ActiveRecord::Base
  include ClienteOuVendedor

  has_many :itens, class_name: "ItemVenda", dependent: :destroy do
    def from_barcode(bc)
      #ItemVenda.from_barcode(bc, proxy_association.owner.id)
      item = Item.from_barcode(bc)
      proxy_association.owner.adiciona_item!(item)
    end
  end

  has_many :pagamentos, -> { where(cd: "C").order('data asc') },  class_name: "Registro", as: :registravel

  def self.from_sacola(sacola_id)
    sacola = Sacola.find(sacola_id)

    venda = Venda.create!(data: Date.today, cliente_id: sacola.cliente_id, tipo: 'C', desconto: 0)

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
