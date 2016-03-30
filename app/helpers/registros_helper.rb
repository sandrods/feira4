module RegistrosHelper

  def label_cd(registro)
    if registro.receita?
      content_tag(:span, 'RECEITA', class: "label label-success")
    else
      content_tag(:span, 'DESPESA', class: "label label-danger")
    end
  end

end
