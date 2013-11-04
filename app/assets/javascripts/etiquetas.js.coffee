# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    
  $('#add_etiqueta').on 'click', (e) ->
    e.preventDefault()
    $('#add_etiqueta_form').slideDown()
    $('#add_etiqueta').fadeOut(300, () -> $('#end_add_etiqueta').show() )


  $('#end_add_etiqueta').on 'click', (e) ->
    e.preventDefault()
    $('#add_etiqueta_form').slideUp()
    $('#end_add_etiqueta').fadeOut(300, () -> $('#add_etiqueta').show() )