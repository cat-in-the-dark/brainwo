$ ->
  class BrainWo.QuizUpdater
    constructor: ->
      @timer = setInterval(@make_bacon, 2000);

    make_bacon: =>
      $question = $('#question')

      $.ajax
        url: $question.data('bacon-url')
        type: 'POST'
        dataType: 'json' 
        data: { my_current_question_id: $question.data('question-id'), my_game_state: $question.data('game-state') }
        success: (res) ->
          console.log res
          if res.reload == true
            $.pjax
              url: ''
              container: '#js-pjax-container'