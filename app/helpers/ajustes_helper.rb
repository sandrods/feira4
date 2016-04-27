module AjustesHelper

  def label_es(es)
    case es.upcase
    when 'E'
      content_tag(:span, 'ENTRADA', class: 'label label-success')
    when 'S'
      content_tag(:span, 'Saída', class: 'label label-danger')
    else
      content_tag(:span, es, class: 'label label-default')
    end
  end

end
