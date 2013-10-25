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
      _type = name == :notice ? "success" : "danger"
      _flashes << <<-HTML
      <div class="alert alert-dismissable alert-#{_type}">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        #{msg}
      </div>
      HTML
    end

    _flashes.html_safe
  end
  
  def glyph(*names)
    names.map! { |name| name.to_s.gsub('_','-') }
    names.map! do |name|
      name =~ /pull-(?:left|right)/ ? name : "glyphicon glyphicon-#{name}"
    end
    content_tag :span, nil, :class => names
  end
  
  def icon(*names)
    text = names.pop
    names << :white unless names.delete(:black)
    raw(glyph(*names) + '&nbsp;'.html_safe + text)
  end
  
  def data_pt_BR(data)
    l(data) unless data.nil?
  end

end
