class DateTimeInput < SimpleForm::Inputs::DateTimeInput

  def input
    @builder.text_field(attribute_name, input_html_options.merge(:autocomplete => 'off'))
  end

  def input_html_classes
    super.push('datepicker input-small')
  end

end