(($) ->
  $.fn.nearBottom = (options) ->
    defaults = {
      pixelsFromBottom: 100,
      delay: 250,
      callback: -> false
    }
    options = $.extend defaults, options

    do checkScrollPosition = ->
      documentHeight = $(document).height()
      scrollHeight = $(document).scrollTop()
      windowHeight = $(window).height()
      pixelsToBottom = documentHeight - scrollHeight - windowHeight

      scrollable = ->
        documentHeight > windowHeight

      nearBottom = ->
        pixelsToBottom <= options.pixelsFromBottom

      enqueueNextCheck = (delay) ->
        setTimeout checkScrollPosition, delay

      if scrollable() && nearBottom()
        if options.callback() == true
          enqueueNextCheck(options.delay)
      else
        enqueueNextCheck(options.delay)
)(jQuery)
