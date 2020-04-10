# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#order_postcode").jpostal({
    click : '#btn',
    postcode : [ "#order_postcode" ],
    address  : {
                  "#order_prefecture_name" : "%3",
                  "#order_address"            : "%4 %5 %6 %7"
                }
  })
