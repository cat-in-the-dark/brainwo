$(function(){
  function updateProgress(current, total) {
    percentage = Math.round(current * 100 / total) + '%';
    $('#pain-pbar').css('width', percentage);
    $('#pain-pbar').text([current, ' / ', total].join(''));
  }
  $('#js-increment-five-action').click(function(event) {
    event.preventDefault();
    $self = $(this);
    $.ajax({
      url: $self.data('url'),
      type: 'POST',
      dataType: 'json',
      data: {'pain_amount': 5},
      success: function(res) {
        updateProgress(res.pain, res.all_pain);
      }
    });
  });
  $('#js-increment-action').click(function(event) {
    event.preventDefault();
    $self = $(this);
    $.ajax({
      url: $self.data('url'),
      type: 'POST',
      dataType: 'json',
      data: {'pain_amount': 1},
      success: function(res) {
        updateProgress(res.pain, res.all_pain);
      }
    });
  });
  $('#js-kill-action').click(function(event){
    event.preventDefault();
    $self = $(this);
    $.ajax({
      url: $self.data('url'), 
      type: 'POST', 
      dataType: 'json', 
      data: {},
      success: function(res) {
        if (res.life_status == 'alive') {
          $('#js-kill-action').toggleClass('btn-success btn-danger');
          $('#js-kill-action').text('Kill');
        } else if (res.life_status == 'killed') {
          $('#js-kill-action').toggleClass('btn-danger btn-success');
          $('#js-kill-action').text('Reanimate');
        }
      }
    });
  });
})
