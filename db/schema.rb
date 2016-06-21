# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160620222703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ajustes", force: :cascade do |t|
    t.string   "tipo",       limit: 1
    t.string   "obs"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "categorias", force: :cascade do |t|
    t.string   "nome"
    t.string   "cd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome",       limit: 60
    t.string   "email",      limit: 40
    t.string   "fone_res",   limit: 20
    t.string   "fone_com",   limit: 20
    t.string   "fone_cel",   limit: 20
    t.string   "endereco",   limit: 60
    t.string   "bairro",     limit: 30
    t.string   "cep",        limit: 10
    t.string   "cidade",     limit: 60
    t.string   "uf",         limit: 2
    t.string   "obs",        limit: 100
    t.integer  "aniver_dia"
    t.integer  "aniver_mes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colecoes", force: :cascade do |t|
    t.string   "descricao",  limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compras", force: :cascade do |t|
    t.integer  "fornecedor_id",                         null: false
    t.date     "data"
    t.decimal  "valor",         precision: 9, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "desconto",      precision: 9, scale: 2
    t.integer  "colecao_id"
  end

  add_index "compras", ["colecao_id"], name: "index_compras_on_colecao_id", using: :btree

  create_table "contas", force: :cascade do |t|
    t.string   "nome",       limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cores", force: :cascade do |t|
    t.string   "nome",       limit: 20, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etiquetas", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "tamanho_id"
    t.integer  "cor_id"
    t.boolean  "gerada",     default: false
    t.datetime "mark"
  end

  create_table "formas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "conta_id"
  end

  add_index "formas", ["conta_id"], name: "index_formas_on_conta_id", using: :btree

  create_table "fornecedores", force: :cascade do |t|
    t.string   "nome",       limit: 30,                 null: false
    t.string   "email",      limit: 60
    t.string   "website",    limit: 60
    t.string   "fone",       limit: 30
    t.string   "cnpj",       limit: 20
    t.string   "endereco",   limit: 80
    t.string   "bairro",     limit: 30
    t.string   "cep",        limit: 8
    t.string   "cidade",     limit: 30
    t.string   "uf",         limit: 2
    t.string   "obs",        limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ativo",                  default: true
  end

  create_table "itens", force: :cascade do |t|
    t.integer  "produto_id", null: false
    t.integer  "tamanho_id", null: false
    t.integer  "cor_id",     null: false
    t.integer  "estoque"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itens", ["cor_id"], name: "index_itens_on_cor_id", using: :btree
  add_index "itens", ["produto_id"], name: "index_itens_on_produto_id", using: :btree
  add_index "itens", ["tamanho_id"], name: "index_itens_on_tamanho_id", using: :btree

  create_table "itens_compra", force: :cascade do |t|
    t.integer  "compra_id"
    t.integer  "item_id",                                      null: false
    t.decimal  "valor",                precision: 9, scale: 2, null: false
    t.string   "tipo",       limit: 1,                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itens_compra", ["compra_id"], name: "index_itens_compra_on_compra_id", using: :btree
  add_index "itens_compra", ["item_id"], name: "index_itens_compra_on_item_id", using: :btree

  create_table "itens_estoque", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "movimento_id"
    t.string   "movimento_type"
    t.string   "tipo",           limit: 1
    t.decimal  "bruto",                    precision: 9, scale: 2
    t.decimal  "desconto",                 precision: 4, scale: 2
    t.decimal  "valor",                    precision: 9, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "itens_estoque", ["item_id"], name: "index_itens_estoque_on_item_id", using: :btree

  create_table "itens_sacola", force: :cascade do |t|
    t.integer  "sacola_id",            null: false
    t.integer  "item_id",              null: false
    t.string   "status",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itens_venda", force: :cascade do |t|
    t.integer  "venda_id",                           null: false
    t.integer  "item_id",                            null: false
    t.decimal  "bruto",      precision: 9, scale: 2
    t.decimal  "desconto",   precision: 4, scale: 2
    t.decimal  "valor",      precision: 9, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "itens_venda", ["item_id"], name: "index_itens_venda_on_item_id", using: :btree
  add_index "itens_venda", ["venda_id"], name: "index_itens_venda_on_venda_id", using: :btree

  create_table "linhas", force: :cascade do |t|
    t.string   "descricao",  limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "ref",           limit: 30
    t.integer  "colecao_id",                                                      null: false
    t.integer  "tipo_id",                                                         null: false
    t.integer  "linha_id",                                                        null: false
    t.integer  "fornecedor_id",                                                   null: false
    t.decimal  "custo",                    precision: 9, scale: 2,                null: false
    t.decimal  "valor",                    precision: 9, scale: 2,                null: false
    t.boolean  "ativo",                                            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lucro",                    precision: 9, scale: 2
    t.decimal  "rentabilidade",            precision: 9, scale: 2
  end

  add_index "produtos", ["colecao_id"], name: "index_produtos_on_colecao_id", using: :btree
  add_index "produtos", ["fornecedor_id"], name: "index_produtos_on_fornecedor_id", using: :btree
  add_index "produtos", ["linha_id"], name: "index_produtos_on_linha_id", using: :btree
  add_index "produtos", ["tipo_id"], name: "index_produtos_on_tipo_id", using: :btree

  create_table "registros", force: :cascade do |t|
    t.date     "data"
    t.string   "descricao",        limit: 60
    t.decimal  "valor",                       precision: 9, scale: 2,                 null: false
    t.string   "cd",               limit: 1
    t.integer  "conta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registravel_id"
    t.string   "registravel_type", limit: 20
    t.integer  "categoria_id"
    t.integer  "forma_id"
    t.boolean  "pago",                                                default: false
    t.integer  "transf_id"
    t.integer  "colecao_id"
  end

  add_index "registros", ["colecao_id"], name: "index_registros_on_colecao_id", using: :btree
  add_index "registros", ["forma_id"], name: "index_registros_on_forma_id", using: :btree

  create_table "sacolas", force: :cascade do |t|
    t.integer  "vendedor_id"
    t.string   "status",      limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.string   "tipo",        limit: 1
  end

  create_table "tamanhos", force: :cascade do |t|
    t.string   "nome",       limit: 10, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "descricao",  limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "vendedor_id"
    t.date     "data"
    t.string   "tipo",        limit: 1
    t.decimal  "valor",                   precision: 9, scale: 2
    t.string   "obs",         limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "desconto",                precision: 9, scale: 2
  end

  add_index "vendas", ["cliente_id"], name: "index_vendas_on_cliente_id", using: :btree
  add_index "vendas", ["vendedor_id"], name: "index_vendas_on_vendedor_id", using: :btree

  create_table "vendedores", force: :cascade do |t|
    t.string   "nome",       limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "compras", "colecoes"
  add_foreign_key "formas", "contas"
  add_foreign_key "itens_estoque", "itens"
  add_foreign_key "registros", "colecoes"
  add_foreign_key "registros", "formas"
end
