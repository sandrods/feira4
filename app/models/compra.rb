class Compra < ActiveRecord::Base

# acts_as_br_date :data
# acts_as_br_float :desconto

  belongs_to :fornecedor
  has_many :itens, class_name: 'ItemCompra', dependent: :destroy

  has_many :pagamentos, -> { where(cd: 'D').order('data desc') }, class_name: "Registro", as: :registravel

  def adiciona_item!(bc)
    ItemCompra.from_barcode(bc, self)
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
