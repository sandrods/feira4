class ItemVenda < ActiveRecord::Base

  belongs_to :venda
  belongs_to :item

  delegate :barcode, :produto, :cor, :tamanho, to: :item

  def self.from_barcode(bc, venda)

    item = Item.find_by_barcode!(bc)

    create_by_item(item, venda)

  end

  def self.create_by_item(item, venda)

    # liquido = (venda.desconto?) ? item.produto.valor * (1-(venda.desconto/100)) : item.produto.valor

    # itens.create!(item_id: item.id, bruto: item.produto.valor, desconto: (desconto || 0), valor: liquido)

    venda.itens.create!(item_id: item.id, valor: item.produto.valor)

  end
end
