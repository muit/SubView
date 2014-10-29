class Atoms.Organism.Account extends Atoms.Organism.Article

  @scaffold "assets/scaffold/account.json"


  # -- Children bubble events --------------------------------------------------
  onButtonTouch: (event, dispatcher, hierarchy...) ->
    # Your code...

  onFormSubmit: (event, dispatcher, hierarchy...) ->
    # Your code...

new Atoms.Organism.Account()
