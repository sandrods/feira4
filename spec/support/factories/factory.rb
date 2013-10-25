# coding: utf-8
FactoryGirl.define do

  factory :tag do
    name Faker::Lorem.word
  end
  
  factory :unidade do
    nome Faker::Lorem.word
  end

  factory :lote do
    nome Faker::Lorem.word
    pedido :pedido
  end

  factory :pedido do
    setor Setor.all.sample
    descricao Faker::Lorem.sentence
    motivo 1
    tipo_contratacao 1
    numero_pae '73/2013'
    numero_simba '10500'
    data Time.now
    responsavel Usuario.da_SA.sample
    prazo 10
    arquivo_solicitacao_proposta ActionDispatch::Http::UploadedFile.new({filename:     'solicitacao_proposta.odt', 
                                                                         content_type: 'application/vnd.oasis.opendocument.text ', 
                                                                         tempfile:     File.new('spec/doc.odt')})
  end

  factory :item_pedido do
    sequence(:numero)
    pedido nil  
    lote nil
    unidade FactoryGirl.create(:unidade)
    tipo 'M'
    descricao Faker::Lorem.sentence
    quantidade 100
    prazo 10
    especificacao Faker::Lorem.sentence
    after(:build) do |item_pedido|
      if item_pedido.pedido.nil?
        item_pedido.pedido = FactoryGirl.create(:pedido)
      end
    end
  end

  factory :fornecedor do
    nome_fantasia Faker::Lorem.sentence
    razao_social Faker::Lorem.sentence
    cnpj '21.171.162/0001-62'
    contato Faker::Lorem.sentence
    telefone '51 9999-9999'
    celular '51 9999-9999'
    email 'usuario@dominio.com'
    site 'www.dominio.com.br'
    endereco Faker::Address.street_name
    complemento 'Bloco 999'
    bairro Faker::Lorem.word
    municipio 'Porto Alegre'
    uf 'RS'
    cep '9090090'
  end

end