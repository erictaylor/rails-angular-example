angular.module('noteApp').service 'GhostDown', () ->

  this.toHtml = (content) ->
    converter = new Showdown.converter()
    html = converter.makeHtml(content)

    return html

  this.editor = ->
    if !document.getElementById('entry-markdown')
      # TODO: REMOVE CONSOLE
      # console.log "editor not found"
      return

    # TODO: REMOVE CONSOLE
    # console.log "editor found"

    converter = new Showdown.converter()
    editor = CodeMirror.fromTextArea(document.getElementById('entry-markdown'),
      mode: 'markdown'
      tabMode: 'indent'
      lineWrapping: true
    )

    updateWordCount = ->
      wordCount = document.getElementsByClassName('entry-word-count')[0]
      editorValue = editor.getValue()

      if editorValue.length
        wordCount.innerHTML = editorValue.match(/\S+/g).length + ' words'

    updatePreview = ->
      preview = document.getElementsByClassName('rendered-markdown')[0]
      preview.innerHTML = converter.makeHtml(editor.getValue())

      updateWordCount()

    $(document).ready ->
      # TODO: REMOVE CONSOLE
      # console.log "document ready"

      $('.entry-markdown header, .entry-preview header').click (e) ->
        $('.entry-markdown, .entry-preview').removeClass('active');
        $(e.target).closest('section').addClass('active')

      editor.on "change", ->
        updatePreview()

      updatePreview()

      # Sync scrolling
      syncScroll = (e) ->
        $codeViewport = $(e.target)
        $previewViewport = $('.entry-preview-content')
        $codeContent = $('.CodeMirror-sizer')
        $previewContent = $('.rendered-markdown')

        codeHeight = $codeContent.height() - $codeViewport.height()
        previewHeight = $previewContent.height() - $previewViewport.height()
        ratio = previewHeight / codeHeight
        previewPosition = $codeViewport.scrollTop() * ratio

        $previewViewport.scrollTop(previewPosition)

      # TODO: Debounce
      $('.CodeMirror-scroll').on "scroll", syncScroll

      # Shadow on Markdown if scrolled
      $('.CodeMirror-scroll').scroll ->
        if $('.CodeMirror-scroll').scrollTop() > 10
          $('.entry-markdown').addClass('scrolling')
        else
          $('.entry-markdown').removeClass('scrolling')

      # Shadow on Preview if scrolled
      $('.entry-preview-content').scroll ->
        if $('.entry-preview-content').scrollTop() > 10
          $('.entry-preview').addClass('scrolling')
        else
          $('.entry-preview').removeClass('scrolling')

      return

    return

  return
