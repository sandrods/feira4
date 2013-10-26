# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :nav_produtos, 'Produtos', '#'
    primary.item :nav_compras, 'Compras', "#"
    primary.item :nav_forn, 'Fornecedores', '#' #, highlights_on: :subpath
    primary.item :nav_cli, 'Clientes', clientes_path
    
    primary.item :nav_config, 'Configurações' do |conf|
      conf.item :nav_colec, 'Coleções', colecoes_path
      conf.item :nav_cores, 'Cores', cores_path
      conf.item :nav_linhas, 'Linhas', linhas_path
      conf.item :nav_size, 'Tamanhos', tamanhos_path
      conf.item :nav_categorias, 'Tipos', tipos_path
    end

    primary.dom_class = 'nav navbar-nav'

  end

end
