$(document).ajaxComplete (event, request) ->

  $('.money').maskMoney()

  $('.ttip').tooltip()

  $(".datepicker").datepicker
    format: "dd/mm/yyyy",
    weekStart: 1,
    autoclose: true,
    language: 'pt-BR'

  $('select.select2_with_clear').select2
    placeholder: 'Selecione'
    allowClear: true

  $('select.select2').select2
      placeholder: 'Selecione'

jQuery ->

  #$(window.location.hash).tab('show') if (window.location.hash)
  $(".nav-tabs a[href='#{window.location.hash}']").tab('show') if (window.location.hash)
  history.replaceState({}, '', location.href.replace(location.hash, '')) if location.hash

  $(".datepicker").datepicker(
    format: "dd/mm/yyyy",
    weekStart: 1,
    autoclose: true,
    language: 'pt-BR'
  )

  $('.select2').select2
    placeholder: 'Selecione'

  $('.select2_with_clear').select2
    placeholder: 'Selecione'
    allowClear: true

