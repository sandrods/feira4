class CreateItemEstoques < ActiveRecord::Migration
  def change
    create_table :item_estoques do |t|
      t.references :item, index: true, foreign_key: true

      t.integer :movimento_id
      t.string :movimento_type

      t.string :tipo, limit: 1

      t.decimal      :bruto,    scale: 2, precision: 9
      t.decimal      :desconto, scale: 2, precision: 4
      t.decimal      :valor,    scale: 2, precision: 9

      t.timestamps null: false
    end
  end
end
