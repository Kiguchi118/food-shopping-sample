# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#address_postcode").jpostal({
    click : '#btn',
    postcode : [ "#address_postcode" ],
    address  : {
                  "#address_prefecture_name" : "%3",
                  "#address_address"            : "%4 %5 %6 %7"
                }
  })
