// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery-fileupload
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).on('page:update', function () {

$('.add-before-stats').click(function() {
  var add_button, max_fields, wrapper, x;
  $('#before-partial').show();
  $('.add-before-stats').hide();
  max_fields = 10;
  wrapper = $('.input_fields_wrap');
  add_button = $('.add_field_button');
  x = 1;
  $(add_button).click(function(e) {
    e.preventDefault();
    if (x < max_fields) {
      x++;
      $(wrapper).append('<div class="center"><input type="text" style="width: 190px" name="exercises[]" placeholder="Exercise"/><input type="text" style="width: 80px" name="weight[]" placeholder="Weight"/><span href="#" class="remove_field glyphicon glyphicon-minus"></span></div>');
    }
  });
  $(wrapper).on('click', '.remove_field', function(e) {
    e.preventDefault();
    $(this).parent('div').remove();
    x--;
  });
});

$('.submit-stats').click(function() {
  $('#before-stats').remove();
});

$('.add-after-stats').click(function() {
  var add_button, max_fields, wrapper, x;
  $('#after-partial').show();
  $('.add-after-stats').hide();
  max_fields = 10;
  wrapper = $('.input_fields_wrap');
  add_button = $('.add_field_button');
  x = 1;
  $(add_button).click(function(e) {
    e.preventDefault();
    if (x < max_fields) {
      x++;
      $(wrapper).append('<div class="center"><input type="text" style="width: 190px" name="exercises[]" placeholder="Exercise"/><input type="text" style="width: 80px" name="weight[]" placeholder="Weight"/><span href="#" class="remove_field glyphicon glyphicon-minus"></span></div>');
    }
  });
  $(wrapper).on('click', '.remove_field', function(e) {
    e.preventDefault();
    $(this).parent('div').remove();
    x--;
  });
});

$('#cancel-before-stats').click(function() {
  $('#before-partial').hide();
  $('.add-before-stats').show();
});

$('#cancel-after-stats').click(function() {
  $('#after-partial').hide();
  $('.add-after-stats').show();
});

$('.edit-before-stats-button').click(function() {
  var add_button, max_fields, wrapper, x;
  $('#edit-before-partial').show();
  $('.edit-before-stats').hide();
  max_fields = 10;
  wrapper = $('.input_fields_wrap_edit_before');
  add_button = $('.add_field_button_edit_before');
  x = 1;
  $(add_button).click(function(e) {
    e.preventDefault();
    if (x < max_fields) {
      x++;
      $(wrapper).append('<div class="center"><input type="text" style="width: 190px" name="exercises[]" placeholder="Exercise"/><input type="text" style="width: 80px" name="weight[]" placeholder="Weight"/><span href="#" class="remove_field glyphicon glyphicon-minus"></span></div>');
    }
  });
  $(wrapper).on('click', '.remove_field', function(e) {
    e.preventDefault();
    $(this).parent('div').remove();
    x--;
  });
});

$('#cancel-edit-before-stats').click(function() {
  $('#edit-before-partial').hide();
  $('.edit-before-stats').show();
});

$('.edit-after-stats-button').click(function() {
  var add_button, max_fields, wrapper, x;
  $('#edit-after-partial').show();
  $('.edit-after-stats').hide();
  max_fields = 10;
  wrapper = $('.input_fields_wrap_edit_after');
  add_button = $('.add_field_button_edit_after');
  x = 1;
  $(add_button).click(function(e) {
    e.preventDefault();
    if (x < max_fields) {
      x++;
      $(wrapper).append('<div class="center"><input type="text" style="width: 190px" name="exercises[]" placeholder="Exercise"/><input type="text" style="width: 80px" name="weight[]" placeholder="Weight"/><span href="#" class="remove_field glyphicon glyphicon-minus"></span></div>');
    }
  });
  $(wrapper).on('click', '.remove_field', function(e) {
    e.preventDefault();
    $(this).parent('div').remove();
    x--;
  });
});

$('#cancel-edit-after-stats').click(function() {
  $('#edit-after-partial').hide();
  $('.edit-after-stats').show();
});


});
















