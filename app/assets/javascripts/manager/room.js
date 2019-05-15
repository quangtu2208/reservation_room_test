$('#room_location').change(function () {
  var selectedValue = $(this).val();
  $('#room_location_id').val($(this).find('option:selected').attr('value'))
});
