#coding: utf-8
require 'spec_helper'

describe Tag do

  describe "attributes definitions" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "#destroy" do

    it "não deve exluir se exite Pedido relacionado" do
      tag = FactoryGirl.create(:tag)
      pedido = FactoryGirl.create(:pedido)

      pedido.tag_list = tag.name
      pedido.save

      expect(tag.destroy).to be_false
    end

    it "não deve exluir se exite Fornecedor relacionado" do
      tag = FactoryGirl.create(:tag)
      fornecedor = FactoryGirl.create(:fornecedor)

      fornecedor.tag_list = tag.name
      fornecedor.save

      expect(tag.destroy).to be_false
    end

  end

end
