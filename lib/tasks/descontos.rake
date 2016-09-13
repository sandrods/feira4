namespace :app do

  task :descontos => :environment do

    Venda.where('desconto = 0 or desconto is null').each do |v|
      v.itens.each { |i| i.update_columns bruto: i.valor, desconto: 0 }
    end

    Venda.where('desconto > 0').each do |v|
      v.itens.each do |i|
        i.update_columns bruto: i.valor
        i.set_desconto v.desconto
      end
    end

  end

end
