# coding: utf-8

class ItemException < Exception
end

class Item < ActiveRecord::Base

  belongs_to :produto
  belongs_to :cor
  belongs_to :tamanho

  has_many :compra_itens

  def self.find_by_barcode!(_bc)

    bc = Barcode.new(_bc)

    item = bc.find_item

    raise ItemException.new("Item não Cadastrado: #{bc}") unless item

    item

  end

  def self.find_or_create_by_barcode(_bc)

    bc = Barcode.new(_bc)

    item = bc.find_item

    item = Item.create!(cor_id: bc.cor.id,
                        tamanho_id: bc.tam.id,
                        produto_id: bc.produto.id,
                        estoque: 0) unless item

    item

  end

  def self.atualiza_estoques!
    t1 = Time.now
    all.each { |i| i.atualiza_estoque! }
    puts Time.now - t1
  end

  def atualiza_estoque!
    e = compra_itens.count
    # e -= venda_itens.count

    update_attribute(:estoque, e)
  end

  def valor_estoque
    estoque * produto.valor
  end

  def barcode
    "#{cor_id.to_s.rjust(2, '0')}#{tamanho_id.to_s.rjust(2, '0')}#{produto_id.to_s.rjust(6, '0')}"
  end

end
