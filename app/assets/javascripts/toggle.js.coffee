jQuery ->
  toggleCheckbox = ->
    that = $(this)
    if that.is(':checked')
      $(that.attr('data-toggle')).show('fast')
    else
      $(that.attr('data-toggle')).hide('fast')
  checkboxes = $('[type=checkbox][data-toggle]')
  checkboxes.change toggleCheckbox
  toggleCheckbox.apply(checkboxes)
