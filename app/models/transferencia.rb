class Transferencia
  include ActiveModel::Model
  attr_accessor :conta_origem, :conta_destino, :data, :valor

  validates :conta_origem, :conta_destino, :data, :valor, presence: true

  def save
    return false unless valid?

    origem = Conta.find @conta_origem
    destino = Conta.find @conta_destino

    Conta.transaction do

      o = origem.registros.create!  data: @data,
                                    descricao: "Transferência #{origem.nome} -> #{destino.nome}",
                                    valor: @valor,
                                    cd: "D"

      d = destino.registros.create! data: @data,
                                    descricao: "Transferência #{origem.nome} -> #{destino.nome}",
                                    valor: @valor,
                                    cd: "C",
                                    transf_id: o.id

      o.update_columns transf_id: d.id

    end

  end

end
