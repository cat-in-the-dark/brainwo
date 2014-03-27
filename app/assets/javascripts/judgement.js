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
        if (res.life_status == 'alive') {
          $('#js-kill-action').toggleClass('btn-success btn-danger');
          $('#js-kill-action').text('Kill');
        } else if (res.life_status == 'killed') {
          $('#js-kill-action').toggleClass('btn-danger btn-success');
          $('#js-kill-action').text('Reanimate');
        }
      }
    });
    console.log(event);
  });
})
