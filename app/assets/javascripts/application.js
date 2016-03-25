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
//= require jquery_ujs
//= require jquery.cookie
//= require jstz
//= require browser_timezone_rails/set_time_zone
//= require jquery.turbolinks
//= require jquery.remotipart
//= require jquery-fileupload
//= require bootstrap
//= require turbolinks
//= require twitter/typeahead
//= require twitter/typeahead/bloodhound
//= require moment
//= require bootstrap-datetimepicker
//= require fotorama
//= require_tree .









$(document).on("change", ".workout-pics input:file", function() {
  var ext = this.value.match(/\.(.+)$/)[1];
    switch (ext) {
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
            $('#workout-pics').attr('disabled', false);
            break;
        default:
            alert('This is not an allowed file type.');
            this.value = '';
            return false;
    }

  $("#workout-pics").attr('class', 'glyphicon glyphicon-ok');
  $(".filename-after").empty();
  for (var i = 0; i < this.files.length; i++)
    {
        $(".filename-after").append(this.files[i].name + "<br>");
    }
  if ($( "#cancel-pics" ).length ) {

  } else {

  $(".filename-after").append('<br><button type="button" class="btn btn-info btn-sm" aria-label="Left Align" id="cancel-pics">Cancel</button><br>');
  
  }

  

});

$(document).on("click", "#cancel-pics", function() {
  $('#cancel-pics').remove();
    $(".filename-after").empty();
    $('#workout-pics').val('');
    $("#workout-pics").attr('class', 'glyphicon glyphicon-plus');
});

















$(document).on("change", ".edit-workout-pics input:file", function() {
  var ext = this.value.match(/\.(.+)$/)[1];
    switch (ext) {
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
            $('#editworkoutpics').attr('disabled', false);
            break;
        default:
            alert('This is not an allowed file type.');
            this.value = '';
            return false;
    }

  $("#edit-workout-pics").attr('class', 'glyphicon glyphicon-ok');
  $(".filename-edit-after").empty();
  for (var i = 0; i < this.files.length; i++)
    {
        $(".filename-edit-after").append(this.files[i].name + "<br>");
    }
  if ($( "#cancel-pics" ).length ) {

  } else {

  $(".filename-edit-after").append('<br><button type="button" class="btn btn-info btn-sm" aria-label="Left Align" id="cancel-edit-pics">Cancel</button><br>');
  
  }

  

});

$(document).on("click", "#cancel-edit-pics", function() {
  $('#cancel-edit-pics').remove();
    $(".filename-edit-after").empty();
    $('#editworkoutpics').val('');
    $("#editworkoutpics").attr('class', 'glyphicon glyphicon-plus');
});























$(document).on('page:update ready', function () {

$('.fotorama').fotorama();

//$('.pagination').hide();



//BEFORE AND AFTER PICTURES

$(document).on("change", ".before-upload input:file", function() {

	var fileName = $(this).val().replace(/.*(\/|\\)/, '');
	$(".filename-before").html(fileName);
	$("#beforeinput").attr('class', 'glyphicon glyphicon-ok');
 
});

$(document).on("change", ".after-upload input:file", function() {
	 
	var fileName = $(this).val().replace(/.*(\/|\\)/, '');
	$(".filename-after").html(fileName);
	$("#afterinput").attr('class', 'glyphicon glyphicon-ok');

});




// STATS
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



//WORKOUT

$('.add-workout').click(function() {
  var add_button, max_fields, wrapper, x;
  $('#workout-form').show();
  $('.add-workout').hide();



  max_fields = 10;
  wrapper = $('.input_fields_wrap_add_workout');
  add_button = $('.add_workout_field_button');
  x = 1;
  $(add_button).click(function(e) {
    e.preventDefault();
    if (x < max_fields) {
      x++;
      $(wrapper).append('<input type="text" style="width: 306px" name="exercise[]" placeholder="Exercise"/><br>' + 
		  '<span class="glyphicon glyphicon-plus btn btn-default btn-sm add-set"> Add set</span>'+
		  '<span class="glyphicon glyphicon-list btn btn-default btn-sm duplicate-set"> Duplicate set</span>'+
		  '<span class="glyphicon glyphicon-minus btn btn-default btn-sm remove-set"> Remove set</span><br>'+
		  '<input type="text" style="width: 80px" name="weight[]" placeholder="Weight"/>'+
		  '<input type="text" style="width: 80px" name="reps[]" placeholder="Reps"/><br><br>');
    }
  });
  $(wrapper).on('click', '.remove_field', function(e) {
    e.preventDefault();
    $(this).parent('div').remove();
    x--;
  });
});

$('#cancel-add-workout').click(function() {
  $('#workout-form').hide();
  $('.add-workout').show();
});








// datepicker workout


var d = new Date();

var month = d.getMonth()+1;
var day = d.getDate();

var output = d.getFullYear() + '/' +
(month<10 ? '0' : '') + month + '/' +
(day<10 ? '0' : '') + day;


$('#datetimepicker1').datetimepicker({
  defaultDate: output,
  format: 'MM/DD/YYYY'
});

$('#datetimepicker2').datetimepicker({
  format: 'MM/DD/YYYY'
});



// flash

$('#flash').delay(200).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
});







// END

});





//--- TYPEAHEAD WORKOUT FUNCTION ---

$(document).on(' ready', function () {



var types = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/typeahead/%QUERY',
    wildcard: '%QUERY'
  }
});

$('.typeahead').each(function(index, element) {
  $(element).typeahead(null, {
    display: 'name',
    source: types,
    minLength: 1,
    highlight: true
  })
});



// this is the event that is fired when a user clicks on a suggestion
	$('.typeahead').each(function(index, element) {
    $(element).bind('typeahead:selected', function(event, datum, name) {



		var name = datum.name
    var x = 0;
    nameDisplay = name
		name = name.replace(/\s+/g, '-')

    $('.typeahead').typeahead('val','');

		wrapper = $(this).closest('.input-group').nextAll('.weight_fields_wrap');

    if ( $('.'+name)[0]) {
      return false;
    }
 
    

		$(wrapper).append('<div class="appended"><div class="'+name+'">'+
				'&nbsp;&nbsp;&nbsp;&thinsp;&thinsp;&thinsp;&thinsp;'+
				'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input disabled="disabled" class="exercise-name" type="text" style="width: 258px" name="exercise[]" value="'+nameDisplay+'"/>'+
			  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-trash exercise-delete" id="'+name+'-delete" aria-hidden="true"></span>'+
			  '<br>'+
			  '<div class="set-buttons"</div>'+
  			  '<button type="button" class="btn btn-default btn-sm add-set" aria-label="Left Align" id="'+name+'-add-set"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp; Add Set</button>'+
  			  '<button type="button" class="btn btn-default btn-sm remove-set" aria-label="Left Align" id="'+name+'-remove-set"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>&nbsp; Remove Set</button>'+
  			  '<button type="button" class="btn btn-default btn-sm duplicate-set" aria-label="Left Align" id="'+name+'-duplicate-set"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>&nbsp; Duplicate Set</button>'+
			  '</div>'+
			  '<div class="'+name+'-set-wrap">'+
			  '</div><hr>'+
			  '</div></div>');

   

		$(document).on('click', '#'+name+'-add-set', function() {
      x++;
	    wrapper = $(this).closest('.set-buttons').next('.'+name+'-set-wrap')
	    $(wrapper).append(
        '<div class="inputs">'+
			  '<input type="text" style="width: 56px" name="exercises['+name+']['+x+'][]" placeholder="Weight"/>'+
        ' x '+
        '<input type="text" style="width: 56px" name="exercises['+name+']['+x+'][]" placeholder="Reps"/><br></div>');
		});

		$(document).on('click', '#'+name+'-remove-set', function() {

	    wrapper = $(this).parent().next('.'+name+'-set-wrap').children("div:last-child");
      $(wrapper).remove();

		});

		$(document).on('click', '#'+name+'-duplicate-set', function() {

      wrapper_append = $(this).parent().next('.'+name+'-set-wrap');
	    wrapper = $(this).parent().next('.'+name+'-set-wrap').children("div:last-child").clone();

      $(wrapper_append).append(wrapper);

		});

		$(document).on('click', '#'+name+'-delete', function() {
      x = 0;
      $(this).closest('.'+name+'-set-wrap').remove();
	    $(this).closest('.'+name).remove();

		});

	})

  });

		






 //END



});



// EDIT WORKOUT MODAL


$(document).on('click', '#edit-workout-form #add-set', function() {

  wrapper = $(this).closest('.set-buttons').next('.set-wrap')
  var nameVar = $(wrapper).children(".inputs").find("input").attr('name');
  var count = $(wrapper).children('.inputs').length;


  var re = /(\[[^\]]*\])\[[^\]]*\]/; 
  var subst = '$1['+count+']'; 

  var result = nameVar.replace(re, subst);




  $(wrapper).append(
    '<div class="inputs">'+
    '<input type="text" style="width: 56px" name="'+result+'" placeholder="Weight"/>'+
    ' x '+
    '<input type="text" style="width: 56px" name="'+result+'" placeholder="Reps"/><br></div>');
});

$(document).on('click', '#edit-workout-form #remove-set', function() {

  wrapper = $(this).parent().next('.set-wrap').children("div:last-child");
      $(wrapper).remove();

});

$(document).on('click', '#edit-workout-form #duplicate-set', function() {


  wrapper_append = $(this).parent().next('.set-wrap');
      wrapper = $(this).parent().next('.set-wrap').children("div:last-child").clone();

      $(wrapper_append).append(wrapper);
});

$(document).on('click', '#edit-workout-form #delete', function() {

  $(this).closest('.set-wrap').remove();
  $(this).closest('.ex-group').remove();

});



$(document).on('hide.bs.modal','#modal', function () {
                
  $('div.appended').hide();

});

$(document).on('submit','#modal', function () {
                
  $('#modal').modal('hide');

});




$(document).on('click', '#remove-session-pic', function() {

  $(this).closest('.col-md-6').remove();

});

































