class ItemCompra < ActiveRecord::Base

  after_create :increment_estoque
  after_destroy :decrement_estoque

  belongs_to :compra
  belongs_to :item

  delegate :barcode, :produto, :cor, :tamanho, to: :item

  def self.from_barcode(bc, compra)

    item = Item.find_or_create_by_barcode(bc)

    if compra.fornecedor_id != item.produto.fornecedor_id
      raise ItemException.new("Fornecedor do Produto diferente do Fornecedor da Compra - #{item.produto.try(:fornecedor).try(:nome)}")
    end

    # valor = (compra.desconto && compra.desconto > 0) ? item.produto.custo * (1-(compra.desconto/100)) : item.produto.custo

    compra.itens.create!(item_id: item.id, tipo: 'C', valor: item.produto.custo)

  end

  private

  def increment_estoque
    item.increment!(:estoque)
  end

  def decrement_estoque
    item.decrement!(:estoque)
  end

end
