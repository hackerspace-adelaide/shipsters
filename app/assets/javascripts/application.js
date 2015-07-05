// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require leaflet

window.setTimeout(function() { $(".alert").alert('close'); }, 4000);

var map_bottom_margin = -30
if ($(window).width() > 767) {
  map_bottom_margin = 20;
}

$(function() {
    $(window).resize(function() {
        if ($('#map').length > 0) {
        	$('#map').height($(window).height() - ($('#map').offset().top + map_bottom_margin));
        }
    });
    $(window).resize();
});