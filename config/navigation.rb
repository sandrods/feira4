# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|

    primary.item :nav_compras, 'Compras' do |prod|
      prod.item :nav_produtos, 'Produtos', produtos_path, highlights_on: :subpath
      prod.item :nav_compras, 'Compras', compras_path, highlights_on: :subpath
      prod.item :nav_forn, 'Fornecedores', fornecedores_path, highlights_on: :subpath
      prod.item :nav_colec, 'Coleções', colecoes_path, highlights_on: :subpath
    end

    primary.item :nav_vendas, 'Vendas' do |venda|
      venda.item :nav_cli, 'Venda Direta', clientes_path
      venda.item :nav_cli, 'Clientes', clientes_path
    end


    
    
    primary.item :nav_config, 'Configurações' do |conf|
      
      conf.item :nav_cores, 'Cores', cores_path
      conf.item :nav_linhas, 'Linhas', linhas_path
      conf.item :nav_size, 'Tamanhos', tamanhos_path
      conf.item :nav_categorias, 'Tipos', tipos_path
    end

    primary.dom_class = 'nav navbar-nav'

  end

end
