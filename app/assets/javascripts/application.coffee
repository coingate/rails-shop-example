#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require underscore.string

#= require core/garber-irish
#= require core/core
#= require_tree ./pages

$ ->
  $('.add-to-cart').on 'ajax:success', -> $.getScript('/cart')

  $('#cart-panel').on 'ajax:success', '#cart-empty', -> $.getScript('/cart') 
