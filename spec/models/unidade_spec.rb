#coding: utf-8
require 'spec_helper'

describe Unidade do

  describe "attributes definitions" do
    it { should validate_presence_of(:nome) }
    it { should validate_uniqueness_of(:nome).case_insensitive }
  end

  describe "#destroy" do

    it "não deve exluir se estiver sendo usando por algum Item de Pedido" do
      item_pedido = FactoryGirl.create(:item_pedido)
      unidade = item_pedido.unidade
      expect(unidade.destroy).to be_false
    end

  end

end
