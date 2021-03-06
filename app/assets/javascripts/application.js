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
//= require bootstrap-sprockets
//= require_tree .
//= require dropdowns-enhancement
//= require tasks
//= require Chart
//= require toastr


  $(document).ready(function() {
    if ( $('#notice').val() ) {
      toastr.success($('#notice').val(), 'Success!')
      $('#notice').val("");
    }
  });

  toastr.options = {
  "debug": false,
  "onclick": null,
  "fadeIn": 300,
  "fadeOut": 1000,
  "timeOut": 1000,
  "extendedTimeOut": 1000
}
