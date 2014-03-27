$(function(){
  $('#js-increment-five-action').click(function(event) {
    event.preventDefault();
    $self = $(this);
    console.log($self.data('url'));
    $.ajax({
      url: $self.data('url'),
      type: 'POST',
      dataType: 'json',
      data: {'pain_amount': 5},
      success: function(res) {
        console.log(res)
      }
    });
  });
  $('#js-increment-action').click(function(event) {
    event.preventDefault();
    $self = $(this);
    console.log($self.data('url'));
    $.ajax({
      url: $self.data('url'),
      type: 'POST',
      dataType: 'json',
      data: {'pain_amount': 1},
      success: function(res) {
        console.log(res);
      }
    });
  });
  $('#js-kill-action').click(function(event){
    event.preventDefault();
    $self = $(this);
    console.log($self.data('url'));
    $.ajax({
      url: $self.data('url'), 
      type: 'POST', 
      dataType: 'json', 
      data: {},
      success: function(res) {
        console.log(res);
      }
    });
    console.log(event);
  });
})
