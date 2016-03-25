class ItemVenda < ActiveRecord::Base

  after_create :decrement_estoque
  after_destroy :increment_estoque

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

  private

  def increment_estoque
    item.increment!(:estoque)
  end

  def decrement_estoque
    item.decrement!(:estoque)
  end

end
