$(document).on('turbolinks:load', function (){
  var location = $('#location');
  var room = $('#service_room_id');

  $(location).change(updateRoomList);

  updateRoomList();
});

function updateRoomList() {
  $.ajax({
    type: 'get',
    url: '/getListRoom?location_id=' + location.value,
    dataType: 'json',
    success: update_option(data)
  });
}

function update_option(data) {
  $('#service_room_id')
    .find('option')
    .remove();
  for (var i = 0; i < data.length; i++) {
    $('#service_room_id').append(
      $(`<option value=${data[i].id}>${data[i].name}</option>`)
    );
}
