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

end
