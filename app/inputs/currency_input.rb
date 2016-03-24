# class CurrencyInput < SimpleForm::Inputs::Base
#   def input
#     "R$ #{@builder.text_field(attribute_name, input_html_options)}".html_safe
#   end
# end

class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:type]  ||= "text"

    @builder.text_field(attribute_name, input_html_options)
  end

  def input_html_classes
    super.push('form-control')
  end
end
