module ClientesHelper

  def links_letras
    lis = Cliente.letras.map do |letra|
      content_tag(:li, class: (params[:letra] == letra) ? 'active' : '') do
        link_to letra, clientes_path(letra: letra)
      end
    end

    content_tag(:ul, lis.join("\n").html_safe, class: 'pagination')
  end

end
