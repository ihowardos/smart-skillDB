# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'progress', (event) ->
    prog = $('#'+@id)
    form = $('#'+@id+'a')
    level = $('#'+@id+'level')
    x = event.pageX - (prog.offset().left)
    xconvert = x / 300 * 100
    xfinal = xconvert.toFixed(0)
    console.log 'final = ' + xfinal
    prog.val xfinal
    level.val xfinal
    form.submit()