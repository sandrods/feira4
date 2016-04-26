module EtiquetasHelper

  def link_mark(etiqueta)
    if etiqueta.selecionada?
      link_to icon(:minus_sign),
              unselect_etiqueta_path(etiqueta),
              remote: true,
              method: 'POST',
              class: 'btn text-danger'
    else
      link_to icon(:plus, 'add'),
              select_etiqueta_path(etiqueta),
              remote: true,
              method: 'POST',
              class: 'btn btn-xs btn-success'
    end
  end

  def nbsp(num = 20)
    ("&nbsp;" * num).html_safe
  end
end
