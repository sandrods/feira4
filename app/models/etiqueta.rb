class Etiqueta < ActiveRecord::Base
  belongs_to :cor
  belongs_to :tamanho
  belongs_to :produto

  validates :cor_id, :tamanho_id, :produto_id, presence: true
end
