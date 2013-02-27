App.ApplicationRoute = Em.Route.extend
  events:
    contact: ->
      @render "contact", into: "application", outlet: "modal"
    close: ->
      $('.modal').modal("hide")
    save: (content) ->
      alert "hi"
