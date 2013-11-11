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

    sacola.itens.incluidos.each { |item_sacola| venda.adiciona_item!(item_sacola.item) }

    venda
  end

  def adiciona_item!(item)

    # liquido = (desconto && desconto > 0) ? item.produto.valor * (1-(desconto/100)) : item.produto.valor

    # return itens.create!(item_id: item.id, bruto: item.produto.valor, desconto: (desconto || 0), valor: liquido)
    itens.create!(item_id: item.id, valor: item.produto.valor)
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