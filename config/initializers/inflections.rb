# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:

ActiveSupport::Inflector.inflections do |inflect|

  inflect.plural /^(.*)ao$/i, '\1oes'
  inflect.singular /^(.*)oes$/i, '\1ao'

  inflect.plural(/^(.*)m$/i, '\1ns')
  inflect.singular(/^(.*)ns$/i, '\1m')

  inflect.plural(/^(.*)r$/i, '\1res')
  inflect.singular(/^(.*)res$/i, '\1r')

  inflect.plural(/^(.*)il$/i, '\1is')
  inflect.singular(/^(.*)is$/i, '\1il')

  inflect.plural(/^(.*)a$/i, '\1as')
  inflect.singular(/^(.*)as$/i, '\1a')

  inflect.plural(/^(.*)l$/i, '\1is')
  inflect.singular(/^(.*)is$/i, '\1l')

  inflect.irregular('item_compra', 'itens_compra')
  inflect.irregular('item_venda', 'itens_venda')

end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
