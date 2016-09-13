$(document).on 'click', '[data-behavior~=load-modal]', (ev) ->
  ev.preventDefault()
  url = this.getAttribute('href') || this.getAttribute('data-url')

  if size = this.getAttribute('data-modal-size')
    $("#global_modal .modal-dialog").addClass("modal-#{size}")

  $("#global_modal .modal-content").load url

  $('#global_modal').modal('show')

$(document).ajaxComplete (event, request) ->

  $('input.money').maskMoney()
  $('input.currency').maskMoney()
  $('.money input').maskMoney()

  $('input.percentage').maskMoney(precision: 0)

  $('.ttip').tooltip()

  $(".datepicker").datepicker
    format: "dd/mm/yyyy",
    weekStart: 1,
    autoclose: true,
    language: 'pt-BR'

  $('select.select2_with_clear').select2
    placeholder: 'Selecione'
    allowClear: true

  $('select:not(.no_select2)').select2
      placeholder: 'Selecione'
      allowClear: true

$(document).on "page:change", ->

  $(".nav-tabs a[href='#{window.location.hash}']").tab('show') if (window.location.hash)
  history.replaceState({}, '', location.href.replace(location.hash, '')) if location.hash

  $(".datepicker").datepicker(
    format: "dd/mm/yyyy",
    weekStart: 1,
    autoclose: true,
    language: 'pt-BR'
  )

  $('select:not(.no_select2)').select2
    placeholder: 'Selecione'
    allowClear: true
    minimumResultsForSearch: 12

  # $('.select2_with_clear').select2
  #   placeholder: 'Selecione'
  #   allowClear: true

  $('input.money').maskMoney()
  $('input.currency').maskMoney()
  $('.money input').maskMoney()

  $('input.percentage').maskMoney(precision: 0)

  $('.ttip').tooltip()

  $('.pop').popover()

  for _spy in $('.affix1')
    spy = $(_spy)
    data = spy.data()

    data.offset = data.offset || {}

    data.offset.bottom = data.offsetBottom if data.offsetBottom
    data.offset.top    = data.offsetTop if data.offsetTop

    spy.affix(data)


  $(".modal").on 'hidden.bs.modal', (e) ->
    $(this).removeData('bs.modal')
    $("#global_modal .modal-dialog").removeClass('modal-lg modal-sm')
