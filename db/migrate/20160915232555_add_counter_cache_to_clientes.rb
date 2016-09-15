class AddCounterCacheToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :vendas_count, :integer
    Cliente.all.each { |c| Cliente.reset_counters c.id, :vendas }
  end
end
