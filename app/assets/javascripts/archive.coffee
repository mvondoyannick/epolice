# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

allowDrop = (ev) ->
  ev.preventDefault()


drag = (ev) ->
  ev.dataTransfer.setData("text", ev.target.id)

drop = (ev) ->
  ev.preventDefault()
  data = ev.dataTransfer.getData("text")
  ev.target.appendChild(document.getElementById(data))

