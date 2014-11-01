class App.Pages.PaymentsSuccess extends App.Pages
  init: ->
    @checkCount = 0
    @maxRetry   = 20

    @checker = setInterval( => 
      @check()
    , 5000)

  check: =>
    $.get '/payments/check', (order) =>
      @checkCount += 1
      if !order
        @redirect('/orders')
      else if order.status isnt 'pending'
        @redirect("/orders/#{order.id}")
      else if @checkCount >= @maxRetry
        @redirect('/orders')

  redirect: (path) =>
    clearInterval(@checker)
    window.location = path