# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#commissariat_departement_id').parent().hide()
  states = $('#commissariat_departement_id').html()
  $('#commissariat_region_id').change ->
    country = $('#commissariat_region_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#commissariat_departement_id').addClass('control-form').html(options)
      $('#commissariat_departement_id').parent().show()
    else
      $('#commissariat_departement_id').empty()
      #$('#commissariat_departement_id').parent().hide()
