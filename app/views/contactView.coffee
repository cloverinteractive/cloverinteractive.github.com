App.ContactView = Em.View.extend
  didInsertElement: ->
    Em.$(".modal").modal
      show: true,
      backdrop: "static"
