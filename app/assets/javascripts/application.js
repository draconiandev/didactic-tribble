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
//= require materialize-sprockets
//= require materialize/extras/nouislider
//= require photoswipe
//= require medium-editor
//= require lazyload
// = require underscore
//= require gmaps/google
//= require cocoon
//= require_tree .

$(document).ready(function() {
    $('input.datepicker').pickadate({
      selectMonths: true,
      format: 'You selecte!d: dddd, dd mmm, yyyy'
    });
    $('.tabs-wrapper .row').pushpin();
    $('select').material_select();
    $('.parallax').parallax();
    $('ul.tabs').tabs();
    $(".button-collapse").sideNav();
    $('input#input_text, textarea#textarea1').characterCounter();
    $(".dropdown-button").dropdown({
        hover: true,
        belowOrigin: true
      });
    $("img").lazyload({
        effect : "fadeIn"
      });
    $('.modal-trigger').leanModal({
        dismissible: true,
        opacity: .85,
        in_duration: 300,
        out_duration: 200,
        starting_top: '4%',
        ending_top: '10%'
      });
    $('.tooltipped').tooltip({delay: 50});
    $('.scrollspy').scrollSpy();
    $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset() });
    $('.slider').slider({full_width: true});
});

$(document).ready(function(){
  $('#showPassword').on('click', function(){
    var passwordField = $('#password');
    var passwordFieldType = passwordField.attr('type');
    if(passwordFieldType === 'password')
    {
        passwordField.attr('type', 'text');
    } else {
        passwordField.attr('type', 'password');
    }
  });
});
