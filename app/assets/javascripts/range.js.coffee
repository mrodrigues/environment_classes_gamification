jQuery ->
  updateRange = ->
    that = $(this)
    value = that.val()
    controls = that.parent('.controls')
    label = controls.find('.range-value')
    if label.length == 0
      label = $("<span class=\"range-value\"></span>")
      controls.append(label)
    console.log(label)
    console.log 'wtf'
    label.html(value)
  ranges = $('input[type=range]')
  ranges.change updateRange
  for range in ranges
    updateRange.apply(range)
