class DateTimeInput < SimpleForm::Inputs::DateTimeInput

  def input(wrapper_options)
    @builder.text_field(attribute_name, input_html_options.merge(:autocomplete => 'off'))
  end

  def input_html_classes
    super.push('datepicker input-sm form-control')
  end

end
