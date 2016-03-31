module RegistrosHelper

  def label_cd(cd)
    if cd.upcase == 'C'
      content_tag(:span, 'RECEITA', class: "label label-success")
    else
      content_tag(:span, 'DESPESA', class: "label label-danger")
    end
  end

end
