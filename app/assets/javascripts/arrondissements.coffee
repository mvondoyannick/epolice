# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#commissariat_arrondissement_id').parent().hide()
  states = $('#commissariat_arrondissement_id').html()
  $('#commissariat_departement_id').change ->
    country = $('#commissariat_region_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#commissariat_arrondissement_id').html(options).addClass('form-control')
      $('#commissariat_arrondissement_id').parent().show()
    else
      $('#commissariat_arrondissement_id').text('Aucune valeur')
#$('#commissariat_arrondissement_id').parent().hide()