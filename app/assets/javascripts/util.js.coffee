jQuery ->

  #$(window.location.hash).tab('show') if (window.location.hash)

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

