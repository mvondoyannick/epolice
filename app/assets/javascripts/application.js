// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require Chart.bundle
//= require chartkick
//= require jquery
//= require leaflet
//= require underscore
//= require rails-ujs
//= require turbolinks
//= require gmaps
//= require_tree .

/* on recherche la classe .fa et on lui ajoute la couleur noire  */
$("i").css('color','#000000');

/* insertion de chart */
var chart = Chartkick.charts['chart-id']

Rails.ajax({
    type: "GET",
    url: "/alertes/1.json",
    success: function(response){
        console.log(response);
    },
    error: function(err){
        console.log(err);
    }
})