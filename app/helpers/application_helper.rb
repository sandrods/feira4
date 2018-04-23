# coding: UTF-8

module ApplicationHelper

  def page_header(title, sub = nil, &block)
    _sub = sub ? "<small>#{sub}</small>" : ""

    actions = content_tag(:div, class: 'actions', &block) if block_given?

    header = <<-HTML
      <div class="page-header">
          <h1>#{title} #{_sub}</h1>
          #{actions}
          <div class="line"></div>
      </div>
      <div class="flash-messages">
        #{flash_messages}
      </div>
    HTML
    header.html_safe
  end

  def flash_messages
    _flashes = ""
    flash.each do |name, msg|
      case name.to_sym
        when :notice, :success
          _type = 'success'
        when :danger, :error, :alert
          _type = 'danger'
        when :info
          _type = 'info'
        end
      _flashes << <<-HTML
      <div class="alert alert-dismissable alert-#{_type}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        #{msg}
      </div>
      HTML
    end
    flash.discard
    _flashes.html_safe
  end

  def glyph(*names)
    names.map! { |name| name.to_s.gsub('_','-') }
    names.map! do |name|
      name =~ /pull-(?:left|right)/ ? name : "glyphicon glyphicon-#{name}"
    end
    content_tag :span, nil, :class => names
  end

  def icon(_icon, text = nil)
    ic = glyph(_icon)
    ic += ('&nbsp;'.html_safe + text.html_safe) if text
    raw(ic)
  end

  def link_to_back(path = nil)
    link_to icon(:arrow_left, "Voltar"), (path || :back), class: 'btn btn-clean'
  end

  def data_pt_BR(data)
    l(data) unless data.nil?
  end

  def input_group(form_builder, field, opts = {})

    _label    = opts.delete(:label)
    _icon     = opts.delete(:icon)
    _content  = opts.delete(:content)
    _position = opts.delete(:position) || 'before'
    _class    = opts.delete(:class)

    if_opts = {}
    if_opts[:label] = _label if _label

    opts.merge!(class: "form-control #{_class}")

    addon_content = _icon ? icon(_icon) : _content

    group_content = [content_tag(:span, addon_content, class: 'input-group-addon'), form_builder.input_field(field, opts)]
    group_content.reverse! if _position.to_s == 'after'

    form_builder.input field, if_opts do
      content_tag(:div, class: "input-group") do
        group_content.join("").html_safe
      end
    end

  end

  def percentage_group(form_builder, field, opts = {})

    opts[:as] = :string
    opts[:content] = '%'
    opts[:position] = 'after'
    opts[:class] = 'percentage'

    value = form_builder.object.send(field)
    opts[:value] = number_with_precision(value, precision: 1)

    input_group(form_builder, field, opts)
  end

  def currency_group(form_builder, field, opts = {})

    opts[:as] = :currency
    opts[:icon] = :usd

    value = form_builder.object.send(field)
    opts[:value] = number_with_precision(value, precision: 2)

    input_group(form_builder, field, opts)
  end

end
