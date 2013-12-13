angular.module("noteApp").directive "noteEditor", (GhostDown) ->

  link = (scope, element, attrs) ->

    displayContent = ->
      element.text content
      GhostDown.editor()

    content = undefined

    scope.$watch attrs.noteEditor, (value) ->
      content = value
      displayContent()

  link: link
