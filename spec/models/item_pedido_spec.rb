#coding: utf-8
require 'spec_helper'

describe ItemPedido do

  describe "attributes definitions" do
    it { should validate_presence_of(:numero) }
    it { should validate_presence_of(:pedido_id) }
    it { should validate_presence_of(:unidade_id) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:especificacao) }
    it { should validate_presence_of(:tipo) }
    it { should validate_presence_of(:quantidade) }
  end

  describe "#create" do

    it "não pode incluir com numero repetido" do
      pedido = FactoryGirl.create(:pedido)
      items_pedido = FactoryGirl.create_list(:item_pedido, 2, pedido: pedido)

      item_pedido1 = items_pedido.first
      item_pedido2 = items_pedido.last
      item_pedido2.numero = item_pedido1.numero

      expect(item_pedido2.save).to be_false
    end

  end

end
