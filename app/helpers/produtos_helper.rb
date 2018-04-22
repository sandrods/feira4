module ProdutosHelper

  def label_estoque(quant)

    color = if quant == 0
              'default'
            elsif quant > 0
              'success'
            else
              'danger'
            end

    content_tag(:span, quant, class: "label label-#{color} label-md")
  end

  def movimento_descr(ie)
    case ie.movimento_type
    when 'Compra'
      link_to "Compra ##{ie.movimento_id}", ie.movimento, class: 'label label-success label-md'
    when 'Venda'
      link_to "Venda ##{ie.movimento_id}", ie.movimento, class: 'label label-danger label-md'
    when 'Ajuste'
      cor = ie.movimento.tipo == 'E' ? 'success' : 'danger'
      link_to "Ajuste ##{ie.movimento_id}", ie.movimento, class: "label label-#{cor} label-md"
    end
  end

end
