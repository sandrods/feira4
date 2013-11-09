class Venda < ActiveRecord::Base
  include ClienteOuVendedor
  
  has_many :itens, class_name: "ItemVenda", dependent: :destroy do
    def from_barcode(bc)
      ItemVenda.from_barcode(bc, proxy_association.owner.id)
    end
  end
  
  has_many :pagamentos, -> { where(cd: "C").order('data asc') },  class_name: "Registro", as: :registravel

  def copia_da_sacola!(sacola_id)
    sacola = Sacola.find(sacola_id)
    sacola.itens.incluidos.each { |item| adiciona_item!(item) }
  end

  def adiciona_item!(item)

    liquido = (desconto && desconto > 0) ? item.produto.valor * (1-(desconto/100)) : item.produto.valor

    return itens.create!(item_id: item.id, bruto: item.produto.valor, desconto: (desconto || 0), valor: liquido)

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