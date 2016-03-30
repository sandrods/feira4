# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ajaxComplete (event, request) ->

  $("[name='registro[pago]'].boolean").bootstrapSwitch
    onColor: 'success'
    onText: 'PAGO'
    offColor: 'danger'
    offText: 'NÃO&nbsp;PAGO'
