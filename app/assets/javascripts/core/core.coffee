window.App =
  init: ->
    execPageSpecific()

class App.Pages
  construct: ->

$(document).ready(App.init)
