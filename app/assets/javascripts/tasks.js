// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function showTable() {
  $(".timeline-wrapper").hide();
  $(".workplan-table").fadeIn();
  $("#table-btn").addClass("active");
  $('#timeline-btn').removeClass("active");
}

function showTimeline() {
  $(".workplan-table").hide();
  $(".timeline-wrapper").fadeIn();
  $("#table-btn").removeClass("active");
  $('#timeline-btn').addClass("active");
}
