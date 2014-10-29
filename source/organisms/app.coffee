class Atoms.Organism.App extends Atoms.Organism.Article

  @scaffold "assets/scaffold/app.json"

  constructor: ->
    super
    @bind "show", @onShow

  # -- Children bubble events --------------------------------------------------
  onButtonTouch: (event, dispatcher, hierarchy...) ->

  onFormSubmit: (event, dispatcher, hierarchy...) ->
    # Your code...

  onNewVideos: (event, dispatcher, hierarchy...) ->
    __.Article.App.children[1].select 0
    __.Article.App.hideAll Atoms.Organism.Section
    __.Article.App.children[2].show();

  onSubscriptions: (event, dispatcher, hierarchy...) ->
    __.Article.App.children[1].select 1
    __.Article.App.hideAll Atoms.Organism.Section
    __.Article.App.children[3].show();

  onSearch: (event, dispatcher, hierarchy...) ->
    __.Article.App.children[1].select 2
    __.Article.App.hideAll Atoms.Organism.Section
    __.Article.App.children[4].show();

  onShow: ->
    __.Article.App.children[1].select 0


new Atoms.Organism.App()
