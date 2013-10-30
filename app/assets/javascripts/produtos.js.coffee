# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

  reload_lucro = () ->
    _custo = $('#produto_custo').val()
    _valor = $('#produto_valor').val()

    $.getJSON "/produtos/lucro", { custo: _custo, valor: _valor }, (data) ->
      $('#lucro').html(data.lucro)
      $('#rentabilidade').html(data.rentabilidade)

  $('#produto_custo').on 'blur', reload_lucro
  $('#produto_valor').on 'blur', reload_lucro

