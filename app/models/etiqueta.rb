class Etiqueta < ActiveRecord::Base
  belongs_to :cor
  belongs_to :tamanho
  belongs_to :produto

  delegate :ref, :fornecedor, :colecao, to: :produto

  validates :cor_id, :tamanho_id, :produto_id, presence: true

  def sub1
    "#{cor.nome} - #{tamanho.nome}"
  end

  def sub2
    "#{ref} #{cor.nome} #{tamanho.nome}"
  end

  def barcode
    "#{cor_id.to_s.rjust(2, '0')}#{tamanho_id.to_s.rjust(2, '0')}#{produto_id.to_s.rjust(6, '0')}"
  end

  def valor
    ActionController::Base.helpers.number_to_currency produto.valor
  end

end
