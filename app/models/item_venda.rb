class ItemVenda < ActiveRecord::Base
  
  belongs_to :venda
  belongs_to :item

  delegate :barcode, :produto, :cor, :tamanho, to: :item

  def ItemVenda.from_barcode(bc, venda_id)

    item = Item.from_barcode(bc)

    venda = Venda.find(venda_id)
    
    venda.adiciona_item!(item)

  end

end
