class ItemEstoque < ActiveRecord::Base

  after_create :ajusta_estoque
  after_destroy :ajusta_estoque

  belongs_to :movimento, polymorphic: true

  belongs_to :item
  delegate :barcode, :produto, :cor, :tamanho, to: :item

  validates :tipo, presence: true, inclusion: { in: ['E', 'S'] }

  scope :vendidos, -> { where(tipo: 'S', movimento_type: 'Venda') }

  private

  def ajusta_estoque
    if (tipo == 'E' && !destroyed?) || (tipo == 'S' && destroyed?)
      item.increment!(:estoque)
    else
      item.decrement!(:estoque)
    end
  end

end
