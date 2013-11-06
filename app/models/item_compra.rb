class ItemCompra < ActiveRecord::Base

  belongs_to :compra
  belongs_to :item

  delegate :barcode, :produto, :cor, :tamanho, to: :item

  def ItemCompra.from_barcode(bc, compra_id)

    item = Item.from_barcode(bc)

    compra = Compra.find(compra_id)

    if compra.fornecedor_id != item.produto.fornecedor_id
      raise ItemException.new("Fornecedor do Produto diferente do Fornecedor da Compra - #{item.produto.try(:fornecedor).try(:nome)}")
    end

    compra.itens.create(item_id: item.id, tipo: 'C', valor: item.produto.custo)

  end

  # def ItemCompra.from_barcode(bc, compra_id = nil)

  #   item = Item.from_barcode(bc)

  #   if compra_id

  #     compra = Compra.find(compra_id)
  #     valor = (compra.desconto && compra.desconto > 0) ? item.produto.custo * (1-(compra.desconto/100)) : item.produto.custo

  #     if compra.fornecedor_id != item.produto.fornecedor_id
  #       raise ItemException.new("Fornecedor do Produto diferente do Fornecedor da Compra - #{item.produto.try(:fornecedor).try(:nome)}")
  #     end

  #   else
  #     valor = item.produto.custo
  #   end

  #   return ItemCompra.create(item_id: item.id, tipo: 'C', valor: valor, compra_id: compra_id)

  # end

end