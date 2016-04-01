# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|

    primary.item :nav_produtos, 'Produtos' do |sub|
      sub.item :nav_produtos1, 'Produtos', produtos_path, highlights_on: :subpath
      sub.item :sep01, nil, class: 'divider'
      sub.item :nav_cores, 'Cores', cores_path
      sub.item :nav_linhas, 'Linhas', linhas_path
      sub.item :nav_size, 'Tamanhos', tamanhos_path
      sub.item :nav_categorias, 'Tipos', tipos_path
    end

    primary.item :nav_compras, 'Compras' do |sub|
      sub.item :nav_compras, 'Compras', compras_path, highlights_on: :subpath
      sub.item :nav_forn, 'Fornecedores', fornecedores_path, highlights_on: :subpath
      sub.item :nav_colec, 'Coleções', colecoes_path, highlights_on: :subpath
    end

    primary.item :nav_vendas, 'Vendas' do |sub|
      sub.item :nav_vendas1, 'Vendas', vendas_path
      sub.item :nav_cli, 'Clientes', clientes_path
    end

    primary.item :nav_finan, 'Financeiro' do |sub|
      sub.item :nav_registros, 'Diário', registros_path
      sub.item :sep02, nil, class: 'divider'
      sub.item :nav_contas, 'Contas', contas_path
      sub.item :nav_cat, 'Categorias', categorias_path
      sub.item :nav_frm, 'Formas de Pagto', formas_path
    end

    primary.dom_class = 'nav navbar-nav'

  end

end
