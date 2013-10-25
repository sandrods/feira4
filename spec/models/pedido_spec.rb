#coding: utf-8
require 'spec_helper'

describe Pedido do

  describe "attributes definitions" do
    it { should validate_presence_of(:setor_id) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:motivo) }
    it { should validate_presence_of(:tipo_contratacao) }
    it { should validate_presence_of(:data) }
  end

  describe "#destroy" do

    it "não deve exluir se exite Item relacionado" do
      item_pedido = FactoryGirl.create(:item_pedido)
      pedido = item_pedido.pedido
      expect { pedido.destroy }.to raise_error(ActiveRecord::DeleteRestrictionError)
    end

  end

end
